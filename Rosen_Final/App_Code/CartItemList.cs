using System;
using System.Collections.Generic;
using System.Web;

public class CartItemList
{
    //internal list of items and the constructor that instantiates it
    private List<CartItem> cartItems;
    public CartItemList()
    {
        cartItems = new List<CartItem>();
    }

    //read-only property that returns the number of items in the internal list
    public int Count
    {
        get { return cartItems.Count; }
    }

    //indexers that locate items in the internal list by index or product id
    public CartItem this[int index]
    {
        get { return cartItems[index]; }
        set { cartItems[index] = value; }
    }

    public CartItem this[string id]
    {
        get
        {
            foreach (CartItem c in cartItems)
                if (c.Room.roomID == id) return c;
            return null;
        }
    }

    //static method to get the cart object from the session state
    public static CartItemList GetCart()
    {
        CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];
        if (cart == null)
            HttpContext.Current.Session["Cart"] = new CartItemList();
        return (CartItemList)HttpContext.Current.Session["Cart"];
    }

    //methods that add, remove and clear items in the internal list
    public void AddItem(Room room, int quantity, DateTime startDate, DateTime endDate)
    {
        CartItem c = new CartItem(room, quantity, startDate, endDate);
        cartItems.Add(c);
    }

    public void RemoveAt(int index)
    {
        cartItems.RemoveAt(index);
    }

    public void Clear()
    {
        cartItems.Clear();
    }
}