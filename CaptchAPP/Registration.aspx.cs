using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaptchAPP
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            if (!IsPostBack)
            {
                RefreshCaptcha();
            }
            //createCaptcha();
        }

        protected void btnRegiser_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["captcha"]).Equals(txtCaptcha.Text))
                Response.Write("Valid Captcha Code");
            else
                Response.Write("InValid Captcha Code");
            RefreshCaptcha();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            RefreshCaptcha();
           
        }
        
        void RefreshCaptcha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()~<>?";
                int catchaLength = 8;
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < catchaLength; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                Session["captcha"] = captcha.ToString();
                imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
            }
            catch
            {

                throw;
            }
        }
    }
}