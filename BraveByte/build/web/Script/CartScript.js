const deleteFromCartList = document.querySelectorAll('.delete');

deleteFromCartList.forEach(deleteButton => {
    deleteButton.addEventListener('click', (e) => {
        const parentElement = deleteButton.parentElement.parentElement;
        
        parentElement.style.transform = 'scaleY(0)';
        
        setTimeout(() => {
            parentElement.style.width = '0';
            setTimeout(() => {
                parentElement.remove();
            }, 500);
        }, 500);
    });
});
