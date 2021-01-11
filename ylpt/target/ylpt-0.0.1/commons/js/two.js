
function chart03(id) {
    var myChart = echarts.init(document.getElementById(id));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            right: '10%',
            bottom: 55,
            itemHeight: 8,
            itemWidth: 8,
            itemGap: 15,
            textStyle: {
                color: "#666666",
                fontSiz: 14
            },
            data: [
                {
                    name: "常驻人口",
                    icon: "circle"
                },

                {
                    name: "流动人口",
                    icon: "circle"
                }
            ]
        },
        series: [
            {
                name: '全员人口',
                type: 'pie',
                radius: ['32%', '47%'],
                center: ['37%', '46%'],
                avoidLabelOverlap: true,
                hoverOffset: 5,
                startAngle: 90,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: false,
                    fontSize: 14,
                    formatter: function (params) {
                        return "{a|" + params.data.name + "}" + "{b|" + params.data.value +  "}"+"{c|人" + "}" + "\n" + params.data.value
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#666666",
                            fontSize: 14
                        },
                        b: {
                            color: "#21a1fa",
                            fontSize: 14
                        },
                        c:{
                            color: "#666666",
                            fontSize: 14
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: 14,
                        formatter: function (params) {
                            var sum = params.data.value2 + params.data.value1;
                            var zb = params.data.value/sum*100;
                            return "{b|● " + "}" + "{a|" + params.data.name + "}" + "{b|" + params.data.value + "}"+"{c|人" + "}" + "\n" + "{a|占比：" + "}" + "{b|" + zb.toFixed(3) + "}"
                        },
                        lineHeight: 18,
                        rich: {
                            a: {
                                color: "#666666",
                                fontSize: 14
                            },
                            b: {
                                color: "#21a1fa",
                                fontSize: 14
                            },
                            c:{
                                color: "#666666",
                                fontSize: 14
                            },
                        }
                    },
                },
                labelLine: {
                    show: true,
                    length: 18,
                    length2: 20,
                    lineStyle: {
                        color: '#374f67',
                    }
                },
                data: [
                    {
                        name: "常驻人口",
                        value: 253,
                        value1: 253,
                        value2: 2226,
                        itemStyle: {
                            color: "#26c2ca"
                        }
                    },

                    {
                        name: "流动人口",
                        value: 2226,
                        value1: 253,
                        value2: 2226,
                        itemStyle: {
                            color: "#35a6ed"
                        }
                    }
                ]
            }]
    };
    myChart.setOption(option);
    return myChart;
};

$(function(){
    var chartInit03 = chart03("chart03");

    function gl(el) {
        //默认其中一个高亮
        el.dispatchAction({
            type: 'highlight',
            dataIndex: 0,
        });

        //离开其中一个模块高亮取消，默认第一块高亮
        el.on("mouseout", function (params) {
            console.log(params);
            el.dispatchAction({
                type: 'downplay',
                dataIndex: params.dataIndex,
            });
            el.dispatchAction({
                type: 'highlight',
                dataIndex: 0,
            });
        });
        //鼠标移入此模块高亮，之前的模块高亮取消
        el.on("mouseover", function (params) {
            el.dispatchAction({
                type: 'highlight',
                dataIndex: params.dataIndex,
            });
            el.dispatchAction({
                type: 'downplay',
                dataIndex: params.dataIndex == 0 ? 1 : 0,
            });
        });

    };
    gl(chartInit03);

    $(window).resize(function(){
        chartInit03.resize();
    });
});