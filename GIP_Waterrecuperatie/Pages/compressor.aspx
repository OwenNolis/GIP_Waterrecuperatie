<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="compressor.aspx.cs" Inherits="GIP_Waterrecuperatie.status_compressor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Compressor</title>
    <link rel="icon" href="\Sources\Images\Icon.ico"/>
    <link rel="stylesheet" href="\Sources\CSS\main.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <a href="home.aspx" class="logo"><asp:Image ID="imgLogo" runat="server" ImageUrl="\Sources\Images\Logo.png" height="50" Width="50"/></a>
            <a href="home.aspx" class="logo">GIP Waterrecuperatie</a>
            <div class="header-right">
                <a href="home.aspx">Home</a>
                <a href="level_tap_water.aspx">Leidingwater</a>
                <a href="level_rainwater.aspx">Regenwater</a>
                <a href="level_bath.aspx">Bad</a>
                <a href="consumption.aspx">Verbruik</a>
                <a href="temperature.aspx">Temperatuur</a>
                <a class="active" href="compressor.aspx">Compressor</a>
                <a href="input_output.aspx">I/O</a>
                <a href="networkcamera.aspx">Camera</a>
                <a href="login.aspx">Logout</a>
            </div>
        </div>
        <br />
        <div class="main">
            <table>
                  <tr>
                    <th>COMPRESSOR</th>
                  </tr>
                  <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblCompressorStartPrefix" runat="server" Text="[Start]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblCompressorStart" runat="server" Text="00:00"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblCompressorEndPrefix" runat="server" Text="[Einde]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblCompressorEnd" runat="server" Text="00:00"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblCompressorTimePrefix" runat="server" Text="[Resterend]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblCompressorTime" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblCompressorTimeSuffix" runat="server" Text="minuten"></asp:Label>
                    </td>
                  </tr>
                </table>
            <br />
            <table>
                <tr>
                    <td>
                        <p>Chart en date picker</p>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="footer">
            <p>GIP Waterrecuperatie | Gitok bovenbouw 2020-2021 | Owen Nolis - Yenthe van Den Eynden - Björn Franck</p>
        </div>
        <script>
            let myVar = setInterval(dataLoad, 5000);

            function dataLoad() {
                $.ajax({
                    type: "POST",
                    url: "home.aspx/LoadData",
                    data: JSON.stringify({ name: "all" }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    },
                    success: function (result) {
                        var values = result['d'].split("#");
                        setValue("compressor", values[5]);
                    }
                });
            }
            function setValue(id, value) {
                document.getElementById(id).innerHTML = value + "%";
                document.getElementById(id).style.width = value + "%";
            }
            function setValue2(id, value) {
                document.getElementById(id).textContent = value;
            }
        </script>
    </form>
</body>
</html>
