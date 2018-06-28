/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let square = document.querySelector('#main');
square.addEventListener("mousemove", (e)=>{
   console.log(square.getBoundingClientRect());
   //let position= square.getBoundingClientRect();
   //square.style.right = e.clientY+"px";
   //square.style.left = e.clientX+"px";
   square.style.left = e.clientX+"px";
   
 //  console.log(e.pageX);
  // console.log(position.x);
   
});