import Typed from 'typed.js';

function loadDynamicBannerText() {

  new Typed('#banner-typed-text', {
    strings: ["Matemática", "Inglês", "Português", "Espanhol", "Biologia", "Química", "Física", "Geografia", "História"],
    typeSpeed: 35,
    loop: true
  });

   new Typed('#banner-typed-galera', {
    strings: ["Conheça a galera", "Passe o mouse"],
    typeSpeed: 50,
    loop: true

  });



}


// Vem o primeiro mas nao vem o segundo, puta que pariu

// function loadDynamicBannerText2() {
//   new Typed('#banner-typed-galera', {
//     strings: ["Conheça a galera", "Passe o mouse"],
//     typeSpeed: 50,
//     loop: true

//   });
// }
export {loadDynamicBannerText };


// export { loadDynamicBannerText2 , loadDynamicBannerText };
