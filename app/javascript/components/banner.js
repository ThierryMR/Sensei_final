import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Matemática", "Inglês", "Português", "Espanhol", "Biologia", "Química", "Física", "Geografia", "História"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
