---
title: "Component Timing"
permalink: /component-timing/
excerpt: "Check your AEM page generation timeline"
modified: 2017-09-10T00:30:00-10:00
author: max@aem.design
---

This is a landing page for AEM.Design Timing component, it will draw a graph for duration of components that executed during AEM server side page generation.

Click here for a [sample output](/component-timing/?data=H4sIAAAAAAAAALVZ227bOBD9lYWeuoBaksPhLX+wr7uPRR9kiUnU1cVryekGRf99h5IcSU6xtS0aCIJE5pwZHo7OzNDfk77sK588JGWdPflPz31d/faB84fwA58UonHy9yRNiqzPkofPn5Mmq32Sfk8O7WDWt23Vl/vkR5p0fXboaamvsn3ni+RL+jl5zpqi8n/5/Hgo+1f68PyBTR2qYaXPik9fuz2tYdl+37HM14XvyqeG5W29bxvf9B3rfb2vst6zXdZ5NtsogzYF59wJqip33S1ws53mkiBRmQCZt03v/+2fj7tAxsF3bfXi/2jy6lj44k/693jI/Qc2LGv62dnH7rn9lgdwv3DMal+UGRsoZ1/zw8PJbuVGg4FUn7k/7SnEyZ4OWVNS9PPHy82tnq7ttTIyFQIGujp/eClzv2RsQM//YXnVHovpc8J4LJ+6pYeFJXuHYhzHVDoeXNS+z0IGXXsiazurFE+FkwFx1xav16LNNtYoOlsl6Yzfks8frsDL2+pYN6z/1rKlrXVoUkGw1gbYsnn2lOa/xqU/67Zh03q2snPCAWEqY4dUeCybYp8dyOxq2HNTJ6UIyBr5goQgARuSfJnOa0SnkKcg4hGjHIbwwQxpTPu66Ayr7LU9nmJjSytnUAZAIQZAoqp7XYvIY3tsKB/LdoU4LmTL9YLDEBwqjmNwj55c5f6SLY/kvZmwM2PBKcKADZJPcW49tKyoy+ZEyfIESdHLvPJs4UOQf5NK3EwR6U+gSCoJ0XJCCDQ2gHJ3S1I02csuWyeFEBpDmOBAb94ycgwnx1EN9FVl8/flCRFWs9lEIIIOIq7cZizC0EQb12YuN02/q9r8AsyJu6URe48gNYkuuTBKq608IqB1hCXsiBUldVDSexVAAcxVqVN29JsyJ/yxSh2UADIgcsQFrbeVmZWxIF0xPHUAY38Q591BLbgLXZRSkSsNQStUBK34kKxZVxZ+q2jN7dRKsZbQpAacKvLYhEQiyYAwKVgztq1XCswQ3Vpf0FCMBAgygr44QS8GaG1dxB07o6lw6ymLt78XQnHaLImOUkObNBWZy0mcitLKThgtlaOu3cFmfRHG0KuQkihyO2I9+Y8F9aJldcFQMS1kSyv2HkIYi46cGD2c1e5A1Tc/HOvdxTzMJuzcWlgOQSKjJoIFTSORUDK6PFgpaSAxDs6rT+2b400VKBi+e3DyhhgGCTmOP/codsIqZ4h+eqthczJaI4FoF3I6y2FQ/2WgyxFzYUJojoeiZFDcbffOoaXWBDRs7hKBCxV2z3EcqcIYe3mbE1az2QQ4CDcM9RGYBK4kpwFdy7sRCYJ0Mowkeizzm4ikftGa1AqntvMolEAIPKoIPJIQgkupb1d345EykfZOSR8hIamJoT7RSCu280gJhEGlUUfgUQJ3ing0wx4f27a/9UpjaQukzNqEULUDGa2YgKSGRw2wHGPXEwKn2h3AlR4vB6YdRbzbWCOCdKR6qYt3u0GIE+806/AbWs0xwFXjRZhGygFTic1dEqDg0gU0KcaNx7zlIHQ1otOMI5dtYpS7jomdn9x1vB0pIpWLMGBH61EJUgoIEuKs2tztAw03FgOa4RLvpp0kzGCCFyrE22NWyMOEAlZN8842AVXhGwrqNLhR4yVIdwHYOJkMY8lsANpCmMPA0BCsL79iHsFCez8Azkbj9bJNgywPcFlBUl3STm4cIc4BggOjderGin4PfOoVdarl3fCtppEN37f90ZKXJERbkSJGkDtFekdtLb28MkLiIg3+JMXKLL+DmQ1PyNd9E/N/T94co9LUA1NSfvnxHyD7yqD/GwAA)

{% raw %}

<script type="text/javascript" src="//rawgit.com/nodeca/pako/master/dist/pako.js"></script>
<script type="text/javascript" src="//www.gstatic.com/charts/loader.js"></script>
<div id="chart_div"></div>

<script>
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

    var base64Data = getParameterByName("data");

    if (base64Data) {

        var compressData = atob(base64Data);

        var compressData = compressData.split('').map(function (e) {
            return e.charCodeAt(0);
        });

        var binData = new Uint8Array(compressData);
        var inflate = pako.inflate(binData);
        var strData = String.fromCharCode.apply(null, new Uint16Array(inflate));

        var jsonData = JSON.parse(strData);
        var data = google.visualization.arrayToDataTable(jsonData.data);

        var options = {
            title: jsonData.title,
            legend: 'none',
            isStacked: true,
            width: 1024,
            height: 1900,
            bars: 'horizontal',
            chartArea: {height: '95%'},
            hAxis: {
                format: 'short',
                minValue: 1,
                showTextEvery: 1,
                gridlines: {count: 10},
                title: 'MICROSECONDS (1/1,000,000)'
            },
            vAxis: {showTextEvery: 1, minValue: 1},
            colors: ['#c6d9fd', '#4d89f9']
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

        chart.draw(data, options);
    } else {
        console.log("not data to graph");
    }

}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
    results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return results[2];
}
</script>


{% endraw %}
