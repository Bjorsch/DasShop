using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Transactions;
using System.Web;
using System.Web.UI;
using DasShop.Models;

namespace DasShop
{
    public static class CartManger
    {
        private const string KEY = "Cart";

        public static List<CartItem> Items
        {
            get
            {
                var context = HttpContext.Current;
                var list = context.Session[KEY] as List<CartItem>;
                if (list == null)
                {
                    context.Session[KEY] = new List<CartItem>();
                }

                list = (List<CartItem>)context.Session[KEY];

                return list;
            }
        }


        public static void Add(int productId, string productName, int quantity, decimal productPrice)
        {
            var item = Items.FirstOrDefault(a => a.ProductID == productId);

            if (item != null)
            {
                item.Quantity += quantity;
                item.TotalPrice = item.Quantity * productPrice;
            }
            else
            {
                var newItem = new CartItem
                {
                    ProductID = productId,
                    ProductName = productName,
                    Quantity = quantity,
                    ProductPrice = productPrice,
                    TotalPrice = quantity * productPrice
                };

                Items.Add(newItem);
                
                
            }
        }
        public static void Subtract(int productId, string productName, int quantity, decimal productPrice)
        {
            var item = Items.FirstOrDefault(a => a.ProductID == productId);

            if (item != null)
            {
                item.Quantity--;
                item.TotalPrice = item.Quantity * productPrice;
            }
            else
            {
                var newItem = new CartItem
                {
                    ProductID = productId,
                    ProductName = productName,
                    Quantity = 1,
                    ProductPrice = productPrice,
                    TotalPrice = quantity * productPrice
                };

                Items.Add(newItem);

            }
        }

        public static void RemoveFromCart(int productId)
        {
            var item = Items.FirstOrDefault(a => a.ProductID == productId);

            Items.Remove(item);
        }


        public static void ClearItems()
        {
            Items.Clear();

        }

        public static int GetProductCount()
        {
            int total = 0;
            foreach (var cartItem in Items)
            {
                total += cartItem.Quantity;
            }
            return total;
        }

        public static decimal GetTotalCost()
        {
            decimal total = 0;
            foreach (var cartItem in Items)
            {
                total += cartItem.ProductPrice * cartItem.Quantity;
            }
            return total;

        }

        public static void AddQuantity(int productId)
        {
            var item = Items.FirstOrDefault(a => a.ProductID == productId);

            item.Quantity++;
            item.TotalPrice = item.ProductPrice * item.Quantity;
        }

        public static void SubtractQuantity(int productId)
        {
            var item = Items.FirstOrDefault(a => a.ProductID == productId);
            
            item.Quantity--;
            item.TotalPrice = item.ProductPrice*item.Quantity;
            if (item.Quantity == 0)
            {
                Items.Remove(item);
            }
        }
    }
}