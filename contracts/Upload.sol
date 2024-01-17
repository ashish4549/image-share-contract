// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Upload {
  //create struct Access with user address and their access default false access
  
  mapping(address=>string[]) value;
  mapping(address=>mapping(address=>bool)) ownership;
  mapping(address=>Access[]) accessList;
  mapping(address=>mapping(address=>bool)) previousData;

  //create add function that need user address and image url and store into value mapping

  
  function allow(address user) external {
      ownership[msg.sender][user]=true; 
      if(previousData[msg.sender][user]){
         for(uint i=0;i<accessList[msg.sender].length;i++){
             if(accessList[msg.sender][i].user==user){
                  accessList[msg.sender][i].access=true; 
             }
         }
      }else{
          accessList[msg.sender].push(Access(user,true));  
          previousData[msg.sender][user]=true;  
      }
    
  }
  function disallow(address user) public{
      ownership[msg.sender][user]=false;
      for(uint i=0;i<accessList[msg.sender].length;i++){
          if(accessList[msg.sender][i].user==user){ 
              accessList[msg.sender][i].access=false;  
          }
      }
  }

  //create display function with input of user address external view check user ==msg.sender or they can access image or not also return value mapping for perticular user

  //create shareAccess() that return access array for perticular user

  //not part of lab session only use for testing purpose
  Access uu;
  function setStruct(address _user,bool val) public{
    uu.user=_user;
    uu.access=val;
  }
  function getStruct() external view returns(Access memory){
    return uu;
  } 
}
