// Function to delete photos 
async function deletePhotos() {
    const deleteSelector = "button[aria-label='Delete']";
    const moveToTrashSelector = "span[text()='Move to trash']"; // May vary based on region/language

    // Select all photos currently loaded in view
    // Note: You might need to manually scroll down to load more if this only grabs the first batch
    const checkboxes = document.querySelectorAll("div[role='checkbox']");
    
    if (checkboxes.length === 0) {
        console.log("No photos found or all selected.");
        return;
    }

    console.log(`Selecting ${checkboxes.length} photos...`);
    checkboxes.forEach(box => box.click());

    // Wait a moment for UI to update
    await new Promise(r => setTimeout(r, 2000));

    // Click the delete button (1)
    const deleteBtn = document.querySelector(deleteSelector);
    if (deleteBtn) {
        deleteBtn.click();
        console.log("Clicked Delete button.");
        
        // Wait for confirmation dialog
        await new Promise(r => setTimeout(r, 2000));
        
        // Confirm deletion (This part is tricky as the selector changes often)
        // You might need to click "Move to trash" manually if this fails
        const confirmBtn = document.evaluate("//span[contains(text(), 'Move to trash')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        
        if (confirmBtn) {
            confirmBtn.click();
            console.log("Confirmed move to trash.");
        } else {
            console.log("Could not find confirmation button. Please click 'Move to Trash' manually.");
        }
    }
}

deletePhotos();