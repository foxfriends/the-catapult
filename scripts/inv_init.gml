///inv_init();
/*
Creates the item database, containing all of the items, their buy/sell values,
a description, and the maximum quantity.
Also creates the inventory, storing the item index and the owned quantity.
*/
//Make the grids global so that they can be used again later. Also declare the variable for the shop grid
InventoryController.itemDB = ds_grid_create(1, 4);  //Create the database
ds_grid_set_region(InventoryController.itemDB, 0, ITEMNAME, ds_grid_width(InventoryController.itemDB) - 1, ITEMNAME, "");
//Add new items to the item database
new_item(   "Cookie",
            "One of mom's delicious home made cookies",
            1,
            sCookie);
new_item(   "Vine",
            "A sturdy plant that can be used to make ropes.",
            5,
            sVine);
new_item(   "Rope",
            "A rope Alice made out of some vines.",
            1,
            sRope);
new_item(   "Key",
            "A key from Wren.",
            1,
            sKey);
new_item(   "Crowbar",
            "A sturdy piece of metal good for prying things.",
            1,
            sCrowbar);
new_item(   "Rock",
            "A very, very heavy rock.",
            1,
            sRock);
new_item(   "Bacon",
            "Delicious strips of uncooked pig flesh.",
            1,
            sBacon);
new_item(   "Grease",
            "The by-product of cooking that delicious bacon.",
            1,
            sGrease);
//Add more for more items... Don't forget to raise the width of the grid if you go over
var invWidth, invHeight;
invWidth = 10;      //Maximum number of slots in the the inventory
invHeight = 2;      //Number of values for each item
InventoryController.inv = ds_grid_create(invWidth, invHeight);    //Create the inventory
//Set the inventory to be empty
ds_grid_set_region(InventoryController.inv, 0, ITEMINDEX, ds_grid_width(InventoryController.inv) - 1, ITEMINDEX, -1);       
ds_grid_set_region(InventoryController.inv, 0, ITEMQTY, ds_grid_width(InventoryController.inv) - 1, ITEMQTY, 0);
