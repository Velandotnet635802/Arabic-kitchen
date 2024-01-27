using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurant.Restaurant
{
    public partial class booking : System.Web.UI.Page
    {
        private string to;
        private object randomCode;
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Booking_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_name.Text == "" || txt_email.Text == "" || txt_datetime.Text == "" || Select1.Text == "" || phone_txt.Text == "")
                {
                    string script = "alert('All Fields are required Please fill the All...!');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
                }
                else
                {
                    Random rand = new Random();
                    randomCode = (rand.Next(999999)).ToString();
                    string Connection = ConfigurationManager.ConnectionStrings["restaurantconnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(Connection);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_Booking", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter param1 = new SqlParameter("@name", SqlDbType.VarChar);
                    cmd.Parameters.Add(param1).Value = txt_name.Text;
                    SqlParameter param2 = new SqlParameter("@email", SqlDbType.VarChar);
                    cmd.Parameters.Add(param2).Value = txt_email.Text;
                    SqlParameter param3 = new SqlParameter("@date_time", SqlDbType.DateTime);
                    cmd.Parameters.Add(param3).Value = txt_datetime.Text;
                    SqlParameter param4 = new SqlParameter("@guest", SqlDbType.VarChar);
                    cmd.Parameters.Add(param4).Value = Select1.Text;
                    SqlParameter param5 = new SqlParameter("@message", SqlDbType.VarChar);
                    cmd.Parameters.Add(param5).Value = message_txt.Text;
                    SqlParameter param6 = new SqlParameter("@phone_no", SqlDbType.VarChar);
                    cmd.Parameters.Add(param6).Value = phone_txt.Text;
                    SqlParameter param7 = new SqlParameter("@code", SqlDbType.VarChar);
                    cmd.Parameters.Add(param7).Value = randomCode;
                    int i = cmd.ExecuteNonQuery();

                    if (i > 0)
                    {
                        Response.Write("Booking Sucessfully and ");
                    }

                    else
                    {
                        Response.Write("Registration Failed");
                    }
                    con.Close();

                    String from, pass, messageBody;


                    MailMessage message = new MailMessage();
                    to = (txt_email.Text).ToString();
                    from = "pettapetta26@gmail.com";
                    pass = "ivpfzmkeevojurzu";
                    messageBody = "Hello " + txt_name.Text + " Thank you for visiting our New Arabic Restaurant..... You Booking OTP Code is : " + randomCode + ".  If Our Team Check the seats Availability on  Your Bookin Period on :" + txt_datetime.Text +
                    " else to our Customer service Team Contact you with in '5 Minutes' for confirmation or Any Other Information & Enquires. And send through on Whatsapp confirmation message to this Number +91" + phone_txt.Text +
                    " Thanks you for Planing to Spend your valuable time with Our 'New Arabic Restaurant' *Terms & Conditions Applied. If any Enquires or Feedback to our Reataruant Click to Send " + "https://localhost:44305/Restaurant/booking.aspx" + "  Thank you from Team 'New Arabic Restaruant'";
                    message.To.Add(to);
                    message.From = new MailAddress(from);
                    message.Body = messageBody;
                    message.Subject = "The New Arabic Restaurant";
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                    smtp.EnableSsl = true;
                    smtp.Port = 587;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(from, pass);

                    try
                    {
                        smtp.Send(message);
                        Response.Write("The Booking OTP Code Send Successfully Check Your Mail : " + txt_email.Text);
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                }


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void txt_name_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_email_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_datetime_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void message_txt_TextChanged(object sender, EventArgs e)
        {

        }
    }
}