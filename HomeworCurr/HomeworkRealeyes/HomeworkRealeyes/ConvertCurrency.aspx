<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConvertCurrency.aspx.cs" Inherits="HomeworkRealeyes.ConvertCurrency" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title></title>
    <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/d3.v3.js"></script>
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/d3.v3.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {

                $("#<%=DropDownList1.ClientID%>").change(function () {

                var Cnamev = $("#DropDownList1").val();

                $.ajax({
                    url: 'Getfile.aspx',
                    method: 'get',
                    contentType: 'application/json;charset=utf-8',
                    data: { Cname: Cnamev },
                    dataType: 'json',
                    success: function (data) {

                        var mynum = Object.keys(data).length;

                        var mapr = data.map(function (i) { return parseFloat(i.Rate); })
                        var date = data.map(function (d) { return new Date(d.Dateme) })

                        var zola = [];
                        for (var i = 0; i < mynum; i++) {

                            zola.push(date[i], mapr[i]);

                        }



                        google.charts.load('current', { 'packages': ['line'] });
                        google.charts.setOnLoadCallback(drawChart);

                        function drawChart() {

                            var data = new google.visualization.DataTable();
                            data.addColumn('date', 'Date');
                            data.addColumn('number', Cnamev);

                            var x;

                            for (x = 0; x <= mynum; x++) {

                                data.addRow([date[x], mapr[x]]);

                            }


                            var options = {
                                width: 600,
                                height: 200,
                                hAxis: {
                                    format: 'M/d/yy',
                                    baselineColor: '#FFFFFF'
                                },
                                vAxis: {
                                    gridlines: { color: 'none' },
                                    format: 'currency',
                                    baselineColor: '#FFFFFF'
                                },
                                axes: {
                                    x: {
                                        0: { side: 'none' },

                                    }
                                }

                            };

                            var chart = new google.charts.Line(document.getElementById('linechart_material'));

                            chart.draw(data, google.charts.Line.convertOptions(options));
                        }




                    }



                });


            });

        });
    }
    </script>

</head>
<body>

    <div class="jumbotron text-center" >
        <h2><b><span class="label label-default">Currency Converter </span></b></h2>
     

    </div>



    <div class="container">
        <div class="row">
            <div class="col-sm-5">
                <form id="form1" runat="server">
                    <asp:ScriptManager ID="mainscriptmanager" runat="server" ></asp:ScriptManager>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel">
                        <ContentTemplate>
                            <br />
                            <br />
                            
                            <asp:Label runat="server" ID="DateTimeLabel1" />

                            <asp:DropDownList ID="DropDownList3"
                                class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                runat="server" DataSourceID="SqlDataSourceRealeyesDate" DataTextField="Dateme" DataValueField="Dateme" Height="30px" Width="130px" DataTextFormatString="{0:dd-MM-yyyy}">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceRealeyesDate" runat="server" ConnectionString="<%$ ConnectionStrings:CDBConnectionString %>" SelectCommand="SELECT DISTINCT  [Dateme] FROM [MyCurrency_tbl] ORDER BY 1"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourceDatae" runat="server" ConnectionString="<%$ ConnectionStrings:CDBConnectionString %>" SelectCommand="SELECT DISTINCT Dateme FROM MyCurrency_tbl ORDER BY Dateme"></asp:SqlDataSource>
                            <br />
                            <br />
                            <asp:DropDownList ID="DropDownList1"
                                class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                runat="server" DataSourceID="SqlDataSourceRealeyescureency" DataTextField="Currency" DataValueField="Currency" Height="30px" Width="130px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceRealeyescureency" runat="server" ConnectionString="<%$ ConnectionStrings:CDBConnectionString %>" SelectCommand="SELECT DISTINCT Currency FROM MyCurrency_tbl ORDER BY Currency"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSourcecurrency" runat="server" ConnectionString="<%$ ConnectionStrings:CDBConnectionString %>" SelectCommand="SELECT DISTINCT Currency FROM MyCurrency_tbl ORDER BY Currency"></asp:SqlDataSource>

                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:TextBox ID="EnterTextbox" Width="160px"
                 placeholder="Enter Amount of money" aria-describedby="basic-addon2"
                 runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:DropDownList ID="DropDownList2" AutoPostBack="true"
                                class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                runat="server" DataSourceID="SqlDataSourceRealeyescureency" DataTextField="Currency" DataValueField="Currency" Height="30px" Width="130px">
                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="DisplayTextbox" runat="server" Width="160px" Enabled="False"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="ConvertBtn" class="btn btn-primary" runat="server" Text="Convert" Height="35px" OnClick="ConvertBtn_Click" Width="88px" />


                        </ContentTemplate>
                    </asp:UpdatePanel>


                </form>
            </div>
            <div class="col-sm-7">
                 <br />
                <br />
                <div id="linechart_material"></div>
            </div>
        </div>
    </div>
</body>


</html>
