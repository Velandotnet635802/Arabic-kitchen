using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Restaurant.Restaurant
{
    public partial class adminverify : System.Web.UI.Page
    {
      
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_verify_Click(object sender, EventArgs e)
        {
            try
            {
                string username = TextBox1.Text;
                string password = TextBox2.Text;


                string validUsername = "velan@12345";
                string validPassword = "velan123";

                if (username == validUsername && password == validPassword)
                {
                    Response.Write("Valid Admin!");
                    Response.Redirect("admin dashboard1.aspx");


                }
                else
                {
                    Response.Write("Invalid Admin Id or Password.");
                }


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

      
        

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}