
document.getElementById('model-open');
  const container = document.getElementById('model-container');
  const modalBg = document.getElementById('model-bg');
  const open = document.getElementById('model-close');

  open.addEventListener('click', ()=>{
    container.classList.add('active');
    modalBg.classList.add('active');
});

