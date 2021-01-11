function chart01(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            padding: [5, 10],
            backgroundColor: "#ffe3cf",
            borderColor: "#ffc197",
            borderWidth: 1,
            textStyle: {
                color: "#df5f12"
            },
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'line',       // 默认为直线，可选为：'line' | 'shadow'
                lineStyle: {
                    color: "#fdccaa",
                    type: 'dashed'
                }
            }
        },
        grid: {
            left: 35,
            right: 70,
            top: 80,
            bottom: 40,
        },
        legend: {
            top: 40,
            right: 0,
            itemWidth: 14,
            itemHeight: 14,
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
            name: "机构名称",
            nameLocation: "end",
            nameTextStyle: {
                fontSize: 14,
                color: '#999999',
            },
            axisTick: {
                show: false
            },
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
            data: ['镇湖街道', '阳山街道', '横塘街道', '科技城', '东渚街道', '浒墅关镇', '狮山街道', '枫桥街道'],
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
        series: [
            {
                name: '常住人口数据量',
                type: 'bar',
                barWidth: 26,
                itemStyle: {
                    color: '#3c99f1',
                    barBorderRadius: [2,2,0,0]
                },
                data: [2, 5, 4, 10, 14, 16, 9, 5]
            }
        ]
    };

    myChart.setOption(option);
    return myChart;
};


$(function(){

    var chartInit01 = chart01("chart01");


    $(window).resize(function(){
        chartInit01.resize();
    });
});