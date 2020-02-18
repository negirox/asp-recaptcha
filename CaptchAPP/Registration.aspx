<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CaptchAPP.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Captcha Code Generation</title>
    <style>
        table, td, th {
            border: 1px solid #ddd;
            text-align: left;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 15px;
        }

        * {
            box-sizing: border-box;
        }

        input[type=text], input[type=password]{
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }

        label {
            padding: 12px 12px 12px 0;
            display: inline-block;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
          
        }

            input[type=submit]:hover {
                background-color: #45a049;
            }

        .container {
            border-radius: 5px;
            width:50%;
            padding: 20px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 600px) {
            .col-25, .col-75, input[type=submit] {
                width: 100%;
                margin-top: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:ScriptManager ID="SM1" runat="server">
            </asp:ScriptManager>

            <table style="border: solid 1px black; padding: 20px; position: relative; top: 50px; text-align: center">
                <tr>
                    <td colspan="2">
                        <h2>Registration Form</h2>
                    </td>

                </tr>
                <tr>
                    <td>Email ID :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmailID" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password :
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password :
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Enter Below Code :
                    </td>
                    <td>
                        <asp:TextBox ID="txtCaptcha" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td valign="middle">
                        <asp:UpdatePanel ID="UP1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td style="height: 50px; width: 100px;">
                                            <asp:Image ID="imgCaptcha" runat="server" />
                                        </td>
                                        <td valign="middle">
                                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnRegiser" runat="server" Text="Register" OnClick="btnRegiser_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
