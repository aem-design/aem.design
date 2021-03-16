// return a promise
function copyToClipboard(textToCopy) {
  // navigator clipboard api needs a secure context (https)
  if (navigator.clipboard && window.isSecureContext) {
    // navigator clipboard api method'
    return navigator.clipboard.writeText(textToCopy);
  } else {
    // text area method
    let textArea = document.createElement("textarea");
    textArea.value = textToCopy;
    // make the textarea out of viewport
    textArea.style.position = "fixed";
    textArea.style.left = "-999999px";
    textArea.style.top = "-999999px";
    document.body.appendChild(textArea);
    textArea.focus();
    textArea.select();
    return new Promise((res, rej) => {
      // here the magic happens
      document.execCommand('copy') ? res() : rej();
      textArea.remove();
    });
  }
}

document.addEventListener("DOMContentLoaded", function() {
  var codeBlocks = document.querySelectorAll('.code-copy-header + .highlighter-rouge');
  var copyCodeButtons = document.querySelectorAll('.copy-code-button');

  console.log("loading code-copy", codeBlocks, copyCodeButtons);

  copyCodeButtons.forEach((copyCodeButton, index) => {
    const code = codeBlocks[index].innerText;

    copyCodeButton.addEventListener('click', () => {
      copyToClipboard(code);
      copyCodeButton.classList.add('copied');

      setTimeout(() => {
        copyCodeButton.classList.remove('copied');
      }, 2000);
    });
  });

});
