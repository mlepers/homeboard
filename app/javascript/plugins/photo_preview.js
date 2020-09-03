const previewImageOnFileSelect = () => {
   
    const input = document.getElementById('photo-input');
    if (input) {
      input.addEventListener('change', () => {
        displayPreview(input);
      })
    }
  }
  
  const displayPreview = (input) => {
    document.getElementById('photo-preview').classList.remove('d-none');
  }
  
  export { previewImageOnFileSelect };