
function chart02(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            padding: [5, 10],
            //backgroundColor: '#529bfb',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'line',        // 默认为直线，可选为：'line' | 'shadow'lineStyle: {
                lineStyle: {
                    color: "#fdccaa",
                    type: 'dashed'
                }
            }
        },
        grid: {
            left: 35,
            right: 45,
            top: 80,
            bottom: 120,
        },
        legend: {
            top: 40,
            right: 42,
            itemWidth: 18,
            itemHeight: 8,
            data: [
                {
                    name: "常住人口数据量",
                    textStyle: {
                        fontSize: 14,
                        color: "#666666"
                    }
                }
            ]
        },
        xAxis:{
            axisTick: {
                show: false
            },
            boundaryGap: false,
            axisLine: {
                show: true,
                lineStyle: {
                    color: "#9fa6b2"
                }
            },
            splitLine: {
                show: false,
            },
            axisLabel: {
                fontSize: 14,
                color: '#666666',
                interval: 0,
                margin: 14,
            },
            data: ['20190102', '20190111', '20190117', '20190124', '20190211', '20190211', '20190102', '20190315', '20190318', '20190321', '20190326', '20190713'],
        },
        yAxis: [
            {
                type: 'value',
                name: "数量",
                nameTextStyle: {
                    fontSize: 14,
                    color: '#666666',
                },
                axisTick: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: "#9fa6b2"
                    }
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: "#d3dae6"
                    }
                },
                splitArea: {
                    show: true,
                    areaStyle: {
                        color: ["#ffffff", "#f6f8fb"]
                    }
                },
                axisLabel: {
                    fontSize: 14,
                    color: '#666666'
                },
                axisPointer: {
                    show: true,
                    lineStyle: {
                        color: "#fdccaa",
                        type: 'dashed'
                    }
                }
            }
        ],
        dataZoom: {
            type: 'slider',
            filterMode: 'empty',
            borderColor: "#cdede2",
            dataBackground: {
                lineStyle: {
                    color: '#79d0b3',
                    width: 1,
                },
                areaStyle: {
                    color: "#d0ede3"
                }
            },
            fillerColor: "rgba(208,236,226,.3)",
            handleStyle: {
                color: "#d0ede3",
                borderColor: "#10ac77"
            },
            bottom: 0,
            top: 370,
            start: 0,
            end: 100
        },
        series: [
            {
                name: '常住人口数据量',
                type: 'line',
                itemStyle: {
                    color: '#3c99f1',
                    barBorderRadius: [2,2,0,0]
                },
                areaStyle: {
                    color: {
                        x: 0,
                        y: 1,
                        x2: 0,
                        y2: 0,
                        colorStops: [{
                            offset: 1, color: '#c6ddfc' // 0% 处的颜色
                        }, {
                            offset: 0, color: 'white' // 100% 处的颜色
                        }],
                        global: false // 缺省为 false
                    }
                },
                data: [1.8, 2.3, 2.5, 2.3, 2.8, 2.1, 1.8, 2.0, 2.4, 2.2, 1.0, 1.5]
            }
        ]
    };

    myChart.setOption(option);
    return myChart;
};

$(function(){
    var chartInit02 = chart02("chart02");

    $(window).resize(function(){
        chartInit02.resize();
    });
});