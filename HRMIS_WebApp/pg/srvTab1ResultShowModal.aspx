<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="srvTab1ResultShowModal.aspx.cs" Inherits="HRWebApp.pg.srvTab1ResultShowModal" %>
<div class="modal-header">
    <button class="close" aria-hidden="true" data-dismiss="modal" type="button"> ×</button>
    <h4 id="srvTab1ResultShowModalTitle" runat="server" class="modal-title"></h4>
</div>
<div class="modal-body">
    <div class="row">
        <div id="resultTable" runat="server" class="col-md-6">
            
        </div>
        <div class="col-md-6">
            <div id="pieChartVal" runat="server" class="hide"></div>
            <canvas id="pieChart" height="120"></canvas>
        </div>
    </div>
</div>
<script type="text/javascript">
    var myNewChart_6;
    var pagefunction = function () {
        // PIE CHART
        var pieOptions = {
            //Boolean - Whether we should show a stroke on each segment
            segmentShowStroke: true,
            //String - The colour of each segment stroke
            segmentStrokeColor: "#fff",
            //Number - The width of each segment stroke
            segmentStrokeWidth: 2,
            //Number - Amount of animation steps
            animationSteps: 100,
            //String - types of animation
            animationEasing: "easeOutBounce",
            //Boolean - Whether we animate the rotation of the Doughnut
            animateRotate: true,
            //Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale: false,
            //Boolean - Re-draw chart on page resize
            responsive: true,
            //String - A legend template
        };
        //alert($('#pieChartVal').val());
        //var pieData = [{ value: 0, color: "#356e35", highlight: "#71843f)", label: "Сонгдо эмнэлэг" }, { value: 1, color: "#6e3671", highlight: "#6e587a)", label: "Интермед эмнэлэг" }, { value: 0, color: "#ac5287", highlight: "#a8829f)", label: "Улсын 2-р эмнэлэг" }, { value: 0, color: "#568a89", highlight: "#57889c)", label: "Улсын 3-р эмнэлэг" }];
        var pieData = $.parseJSON($('#pieChartVal').text());

        // render chart
        var ctx = document.getElementById("pieChart").getContext("2d");
        myNewChart_6 = new Chart(ctx).Pie(pieData, pieOptions);

        // END PIE CHART
    };
    loadScript("../js/plugin/chartjs/chart.min.js", pagefunction);
    var pagedestroy = function () {
        //destroy all charts
        myNewChart_6.destroy();
        myNewChart_6 = null;
        if (debugState) {
            root.console.log("âœ” Chart.js charts destroyed");
        }
    }
</script>
