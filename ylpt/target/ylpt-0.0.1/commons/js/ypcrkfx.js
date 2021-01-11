
function chart01(id) {
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333';
    var chartData = [
        { name: '科技城医院', value: 13000 },
        { name: '高新区医院', value: 14000 },
        { name: '明基医院', value: 11500 },
    ];

    var xData = [];
    var sData = [];

    $.each(chartData, function (index, item) {
        xData.push(item.name);
        sData.push(item.value)
    });

    var lineOption = {
        lineStyle: {
            color: 'rgba(51,51,51,.75)',
            type: 'solid'
        }
    };
    var option = {
        tooltip: {
            trigger: 'none',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            itemHeight: 12,
            itemWidth: 12,
            right: '4%',
            top: "2%",
            itemGap: 15,
            textStyle: {
                color: "#333333",
                fontSize: 12
            },
            data: [
                {
                    name: "门诊药品费用",
                },
                {
                    name: "住院药品费用",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '12%',
            right: '4%',
            left: '3%',
            bottom: '12%'
        },
        yAxis: [{
            name: '万元',
            nameGap: 13,
            nameTextStyle: {
                color: fontColor,
                fontSize: 12
            },
            axisLabel: {
                formatter: '{value}',
                color: fontColor,
                textStyle: {
                    fontSize: 12
                }
            },
            axisTick: {
                show: false
            },
            axisLine: lineOption,
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#ededed'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: xData,
            axisLine: lineOption,
            boundaryGap: true,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: fontColor,
                interval: 0,
                textStyle: {
                    fontSize: 12
                }
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#ededed'
                }
            },
            splitArea: {
                show: false
            }
        }],
        series: [
            {
                name: '门诊药品费用',
                type: 'bar',
                barWidth: 24,
                data: [12500,11000,13000],
                itemStyle: {
                    color: '#3AA874'
                },
                label: {
                    show: false,
                    position: 'top',
                    formatter: function (params) {
                        return '{a|' + params.value + '万元}\n' + '{b|}'
                    },
                    rich: {
                        a: {
                            backgroundColor: 'rgba(102, 166, 76, .6)',
                            padding: [3, 6, 6, 6],
                            borderRadius: 2,
                            color: '#FFFFFF',
                            fontSize: 12
                        },
                        b: {
                            width: 5,
                            height: 5,
                            align: 'center',
                            backgroundColor: { image: 'images/bafx/small-bg02.png' }
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                    }
                },
            },
            {
                name: '住院药品费用',
                type: 'bar',
                barWidth: 24,
                data: sData,
                itemStyle: {
                    color: '#5892F3'
                },
                label: {
                    show: false,
                    position: 'top',
                    formatter: function (params) {
                        return '{a|' + params.value + '万元}\n' + '{b|}'
                    },
                    rich: {
                        a: {
                            backgroundColor: 'rgba(21, 114, 213, .6)',
                            padding: [3, 6, 6, 6],
                            borderRadius: 2,
                            color: '#FFFFFF',
                            fontSize: 12
                        },
                        b: {
                            width: 5,
                            height: 5,
                            align: 'center',
                            backgroundColor: { image: 'images/bafx/small-bg01.png' }
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                    }
                },
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart02(id) {
    var myChart = echarts.init(document.getElementById(id));
    var max = [100000, 100000, 100000,100000, 100000, 100000,100000,100000,100000,100000]
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            containLabel: true,
            top: '8%',
            right: '9%',
            left: 5,
            bottom: '6%'
        },
        legend: {
            show:false,
            itemWidth: 12,
            itemHeight: 12,
            data: ['人数'],
            top: '0',
            right: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    show:false,
                    color: '#333333',
                    interval: 0,
                    textStyle: {
                        fontSize: 12
                    }
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#D6D6D6',
                    }
                },
                data: ['氯化钠注射液', '牡蛎*锻','益母草', '白芍*麸炒','柴胡', '氯化钠注射液1', '山药*生', '党参', '黄芪*生', '生地'].reverse(),
                splitArea: {
                    show: false
                },
            }],
        xAxis: [{
            type: 'value',
            name: "人",
            nameGap: 7,
            nameTextStyle: {
                color: '#646464',
                fontSize: 14
            },
            axisLine: {
                show: true,
                lineStyle:{
                    color:'#D6D6D6'
                }
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#000000',
                textStyle: {
                    fontSize: 12
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                  type:"dashed",
                  color:"#D6D6D6"
                }          
            },
        }],
        series: [
            {
                name: '人数',
                type: 'bar',
                data: [
                    {
                      name:'氯化钠注射液',
                      value:38887,
                      itemStyle:{
                          color:'#F7B764'
                      },
                      label:{
                          color:'#F7B764'
                      }
                    },
                    {
                      name:'牡蛎*锻',
                      value:43887  
                    },
                    {
                      name:'益母草',
                      value:43887  
                    },
                    {
                      name:'白芍*麸炒',
                      value:78887  
                    },
                    {
                      name:'柴胡',
                      value:42430 
                    },
                    {
                      name:'氯化钠注射液1',
                      value:40698 
                    },
                    {
                        name:'山药*生',
                        value:38390,
                        itemStyle:{
                            color:'#F7B764'
                        },
                        label:{
                            color:'#F7B764'
                        } 
                    },
                    {
                      name:'党参',
                      value:35909 
                    },
                    {
                        name:'黄芪*生',
                        value:40787,
                        itemStyle:{
                            color:'#F7B764'
                        },
                        label:{
                            color:'#F7B764'
                        } 
                    },
                    {
                      name:'生地',
                      value:24609  
                    }
                ].reverse(),
                barWidth: 13,
                itemStyle: {
                  color: '#88CA6D'
                },
                label: {
                    show: true,
                    position:'right',
                    color:'#88CA6D',
                    fontSize:14,
                    formatter:function(params){
                        return params.value
                    }
                }
            },
            {
                name: '',
                type: 'bar',
                data: max,
                barWidth: 13,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(153, 123, 230, 0.1)'
                },
                tooltip: {
                    show: false
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart03(id) {
    var myChart = echarts.init(document.getElementById(id));
    var data = [
        {
          name:'九价HPV疫苗',
          value:38887,
        },
        {
          name:'注射用阿奇霉素',
          value:43887  
        },
        {
          name:'注射用头孢呋辛钠',
          value:43887  
        },
        {
          name:'盐酸左氧氟沙星注射液',
          value:78887  
        },
        {
          name:'狂犬病人免疫球蛋白',
          value:42430 
        },
        {
          name:'吸入用布地奈德混悬液',
          value:40698 
        },
        {
            name:'氯化钠注射液',
            value:38390,
        },
        {
          name:'注射用派拉西林钠他矬巴坦纳',
          value:35909 
        },
        {
            name:'三七粉',
            value:40787,
        },
        {
          name:'13价肺炎疫苗',
          value:24609  
        },
        {
          name:'头孢克亏颗粒',
          value:38887,
        },
        {
          name:'雷贝拉矬钠肠溶胶囊',
          value:43887  
        },
        {
          name:'注射用头孢曲松钠',
          value:43887  
        },
        {
          name:'注射用头孢西丁钠',
          value:78887  
        },
        {
          name:'注射用乳糖酸阿奇霉素',
          value:42430 
        },
        {
          name:'注射用头孢硫眯',
          value:40698 
        },
        {
            name:'注射用血塞通',
            value:38390,
        },
        {
          name:'低分子量肝素钙注射液',
          value:35909 
        },
        {
            name:'孟鲁司特钠咀嚼片',
            value:40787,
        },
        {
          name:'蒲地兰消炎口服液',
          value:24609  
        }
    ].reverse();
    var max=[];
    for(var i=0;i<data.length;i++){
        max.push({value:100000,value1:data[i].value})
    };
    console.log(max);
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            containLabel: true,
            top: '3%',
            right: '22%',
            left: 5,
            bottom: '8%'
        },
        legend: {
            show:false,
            itemWidth: 12,
            itemHeight: 12,
            data: ['人数'],
            top: '0',
            right: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    show:false,
                    color: '#333333',
                    interval: 0,
                    textStyle: {
                        fontSize: 12
                    }
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#D6D6D6',
                    }
                },
                data: ['九价HPV疫苗', '注射用阿奇霉素','注射用头孢呋辛钠', '盐酸左氧氟沙星注射液','狂犬病人免疫球蛋白', '吸入用布地奈德混悬液', '氯化钠注射液', '注射用派拉西林钠他矬巴坦纳', '三七粉', '13价肺炎疫苗','头孢克亏颗粒', '雷贝拉矬钠肠溶胶囊','注射用头孢曲松钠', '注射用头孢西丁钠','注射用乳糖酸阿奇霉素', '注射用头孢硫眯', '注射用血塞通', '低分子量肝素钙注射液', '孟鲁司特钠咀嚼片', '蒲地兰消炎口服液'].reverse(),
                splitArea: {
                    show: false
                },
            }],
        xAxis: [{
            type: 'value',
            nameGap: 7,
            nameTextStyle: {
                color: '#646464',
                fontSize: 14
            },
            axisLine: {
                show: true,
                lineStyle:{
                    color:'#D6D6D6'
                }
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                show:false,
                margin: 10,
                color: '#000000',
                textStyle: {
                    fontSize: 12
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                  type:"dashed",
                  color:"#D6D6D6"
                }          
            },
        }],
        series: [
            {
                name: '人数',
                type: 'bar',
                data: data,
                barWidth: 13,
                itemStyle: {
                  color: '#30A9FF'
                },
                label: {
                    show: false,
                    position:'right',
                    color:'#88CA6D',
                    fontSize:14,
                    formatter:function(params){
                        return params.value
                    }
                }
            },
            {
                name: '',
                type: 'bar',
                data: max,
                barWidth: 13,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(90, 184, 235, 0.1)'
                },
                label:{
                    show:true,
                    position:'right',
                    formatter:function(params){
                        return "{a| "+(params.data.value1/10000).toFixed(2)+"}"+"{b|万}"
                    },
                    rich:{
                        a:{
                            color:'#0BACFF',
                            fontSize:16
                        },
                        b:{
                            color:'#333',
                            fontSize:16
                        }
                    }
                },
                tooltip: {
                    show: false
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};

$(function () {
    var chartInit01 = chart01('chart01');
    var reschartInit01 = chart01('reschart01');
    var chartInit02 = chart02('chart02');
    var chartInit03 = chart03('chart03');

    $(".modeTop .title .tabTop span").click(function () {
        $(this).addClass("active").siblings("span").removeClass("active");
        $(this).parents(".mode").find(".modeCon").eq($(this).index()).show().siblings(".modeCon").hide();
        chartInit01.resize();
        reschartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
    });
    $(window).resize(function () {
        chartInit01.resize();
        reschartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
    });
});