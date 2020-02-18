using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace CaptchAPP
{
    public partial class GenerateCaptcha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            createCaptcha();
        }
        void createCaptcha()
        {
            string captcha = Convert.ToString(Session["captcha"]);
            if (!string.IsNullOrEmpty(captcha))
            {
                int height = 50;
                int width = 200;
                Bitmap bmp = new Bitmap(width, height);
                RectangleF rectf = new RectangleF(20, 10, 0, 0);

                Graphics g = Graphics.FromImage(bmp);
                g.Clear(Color.White);
                g.SmoothingMode = SmoothingMode.AntiAlias;
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;
                g.DrawString(captcha, new Font("Georgia", 12, FontStyle.Bold), Brushes.Green, rectf);
                g.DrawRectangle(new Pen(Color.Red), 1, 1, width - 2, height - 2);
                g.Flush();
                Response.ContentType = "image/jpeg";
                bmp.Save(Response.OutputStream, ImageFormat.Jpeg);
                g.Dispose();
                bmp.Dispose();
            }
        }
    }
}