// Initialize switching sections for doors

if newSectionXOffset > 0 // Switching to the right
{
    playerCameraInit();
    with instanceCreate(x, y, objSectionSwitcher) 
    {
        dir = "right";
        door = true;
    }
}
else if newSectionXOffset < 0 // Switching to the left
{
    playerCameraInit();
    with instanceCreate(x, y, objSectionSwitcher)
    {
        dir = "left";
        door = true;
    }
}

