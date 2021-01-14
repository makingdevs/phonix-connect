import "amazon-connect-streams"

var containerDiv = document.getElementById("container-div");
var instanceURL = "https://makingdevs.awsapps.com/connect/ccp-v2/";
function init() {
  connect.core.initCCP(containerDiv, {
    ccpUrl: instanceURL,            
    loginPopup: true,               
    loginPopupAutoClose: true,      
    loginOptions: {                 
      autoClose: true,              
      height: 600,                  
      width: 400,                   
      top: 0,                       
      left: 0                       
    },
    softphone: {                    
      allowFramedSoftphone: true,   
      disableRingtone: false,       
      ringtoneUrl: "./ringtone.mp3" 
    }
  });
}
init()

var name = document.getElementById("name");
var state = document.getElementById("state");
connect.agent(function(agent) { 
  name.textContent=agent.getName();
  state.textContent=agent.getState().name;
  agent.onStateChange(function(agentStateChange) {
    state.textContent=agent.getState().name;
  });
});

var number = document.getElementById("number");
var stateContact = document.getElementById("stateContact");
var attr = document.getElementById("attr");

connect.contact(function(contact) {
  contact.onConnected(function(contact) {
    var numberClient = contact.getAttributes().number_client.value
    debugger
    $.get("/users/api/"+numberClient)
    .done(function({user:user}) {
      $("#nameClient").text(user.name);
      $("#numberClient").text(user.number_client);
      $("#phone").text(user.phone);
    })
    .fail(function() {
      console.log("error");
    });
    attr.textContent=contact.getAttributes().number_client.value;
    stateContact.textContent=contact.getState().type;
    number.textContent=contact.getConnections()[1].getEndpoint().phoneNumber;
  });
});