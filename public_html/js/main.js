/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let square = document.querySelector('#main');
let left = 50;
let tops = 50;
let transf=0;
let change=false;
let rot=false;
document.querySelector('#color').addEventListener("change", ()=>{
   if (document.querySelector('#color').checked) {
     change=true;
   }else {
      change=false
   }

   
});
document.querySelector('#rotat').addEventListener("change", ()=>{
   if (document.querySelector('#rotat').checked) {
     rot=true;
   }else {
      rot=false
   }

   
});
square.addEventListener("mouseover", (e)=>{
   let square2 = document.querySelector('#square');
   if (change) {
      changeColor(square2);
   }
   if (rot) {
      rotate(square2, 15);
   }
   
   let position2= square2.getBoundingClientRect();
   let skok=2;
 if (e.pageX<position2.left && e.pageY>position2.top && e.pageY<position2.bottom) {
    left +=skok;
     square.style.left = left+"%";
  
   }else if (e.pageX>position2.right && e.pageY<position2.bottom && e.pageY>position2.top) {
      left -=skok;
     
      square.style.left = left+"%";

   }else if (e.pageX>position2.left && e.pageX<position2.right && e.pageY>position2.bottom) {
      tops -= skok;
         square.style.top = tops+"%";
      
   }else  if (e.pageX>position2.left && e.pageX<position2.right && e.pageY<position2.top) {
        tops += skok;
         square.style.top = tops+"%";
      
   }else if (e.pageX<position2.left && e.pageY<position2.top){
    tops += skok;
    left += skok;
    square.style.top = tops+"%";
    square.style.left = left+"%";
   }else if (e.pageX>position2.right && e.pageY<position2.top){
      tops +=skok;
    left -=skok;
    square.style.top = tops+"%";
    square.style.left = left+"%";
    
   }else  if (e.pageX>position2.right && e.pageY>position2.bottom) {
         tops -= skok;
    left -=skok;
    square.style.top = tops+"%";
    square.style.left = left+"%";
   
   }else  if (e.pageX<position2.left && e.pageY>position2.bottom) {
         tops -= skok;
    left +=skok;
    square.style.top = tops+"%";
    square.style.left = left+"%";
   }   
});
/**
 * Zmiana koloru
 */
function changeColor(el) {
   
   var a = Math.floor(Math.random()*256);
   var b = Math.floor(Math.random()*256);
   var c = Math.floor(Math.random()*256);
   
   el.style.backgroundColor = `rgb(${a}, ${b}, ${c})`;
   
}

function rotate(el, skok){
   transf+=skok;
   el.style.transform = `rotate(${transf}deg)`;
}
 /**
  * Comment
  */
//function rotate(element) {
//   
//}