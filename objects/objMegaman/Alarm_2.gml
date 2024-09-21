// Initialize switching sections for doors

if newSectionXOffset > 0 // Switching to the right
{
    playerCameraInit();
    with instanceCreate(x, y, objSectionSwitcher) 
    {
        dir = Directions.RIGHT;
        door = true;
    }
}
else if newSectionXOffset < 0 // Switching to the left
{
    playerCameraInit();
    with instanceCreate(x, y, objSectionSwitcher)
    {
        dir = Directions.LEFT;
        door = true;
    }
}

