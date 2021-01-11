<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

<div class="container-fluid">
    <div class="row" style="padding: 0 30px;">
    	<div class="col-lg-12">
           <div class="card">
               <div class="card-body">
                   <h4 class="card-title mb-5 font-weight-bold">이번 달 일별 가입자</h4>
                   <canvas id="daliyJoin" width="500" height="250"></canvas>
               </div>
           </div>
       </div>
    </div>
    <script>
  		var daliyJoin = document.getElementById("daliyJoin");
  		daliyJoin.height = 150;
  		var daliyJoinLabels = [];
        var daliyJoinData =[];
  		 $.each(JSON.parse('${dailyJoin}'), function(index, item) {
  	  		daliyJoinLabels.push(item.JOINDATE);
  	  		daliyJoinData.push(item.CNT);
	  	});
  		var myChart = new Chart(daliyJoin, {
  			type: 'line',
  	        data: {
  	            labels: daliyJoinLabels,
  	            datasets: [{
  	               	data: daliyJoinData,
  	               	backgroundColor: [
  	               		"rgba(117, 113, 249, 0.5)"
  	                   ],
  	                   borderColor: [
  	                   	"rgba(117, 113, 249, 0.9)"
  	                   ],
  	                   borderWidth: "0"
  	            }]
  	        },
  	      options: {
  	  	      legend: {
	              display: false
	          },
              tooltips: {
                  mode: 'index',
                  intersect: false
              },
              hover: {
                  mode: 'nearest',
                  intersect: true
              },
              scales: {
                  yAxes: [{
                     ticks: {
                        min: Math.min.apply(this, daliyJoinData),
                        max: Math.max.apply(this, daliyJoinData),
                        callback: function(value, index, values) {
                           if (index === values.length - 1) return Math.min.apply(this, daliyJoinData);
                           else if (index === 0) return Math.max.apply(this, daliyJoinData);
                           else return '';
                        }
                     }
                  }]
               }

          }
  		});
  		</script>
    <div class="row" style="padding: 0 30px;">
    	<div class="col-lg-6">
           <div class="card">
               <div class="card-body">
                   <h4 class="card-title mb-5 font-weight-bold">성별</h4>
                   <canvas id="gender" width="500" height="250"></canvas>
               </div>
           </div>
       </div>
  		<script>
	  		var gender = document.getElementById("gender");
	  		gender.height = 250;
	  		var myChart = new Chart(gender, {
	  			type: 'bar',
	  	        data: {
	  	            labels: ["남자 회원", "여자 회원"],
	  	            datasets: [{
	  	               	data: ['${menCount}', '${womenCount}'],
	  	               	backgroundColor: [
	  	               		"rgba(117, 113, 249, 0.5)",
	  	               		"rgba(144,	104, 190,0.7)"
	  	                   ],
	  	                   borderColor: [
	  	                   	"rgba(117, 113, 249, 0.9)",
	  	                   	"rgba(144,	104, 190,0.9)"
	  	                   ],
	  	                   borderWidth: "0"
	  	            }]
	  	        },
	  	        options: {
	  	        	legend: {
	  	                display: false
	  	            },
	  	            scales: {
	  	                yAxes: [{
	  	                    ticks: {
	  	                        beginAtZero: true
	  	                    }
	  	                }]
	  	            }
	  	        }
	  		});
  		</script>
  		<div class="col-lg-6">
           <div class="card">
               <div class="card-body">
                   <h4 class="card-title mb-5 font-weight-bold">분야별 판매량</h4>
                   <canvas id="bookCategory" width="500" height="250"></canvas>
               </div>
           </div>
       </div>
       <script>
	  		var bookCategory = document.getElementById("bookCategory");
	  		bookCategory.height = 250;
	  		var salesRatioLabels = [];
	        var salesRatioData =[];
	  		 $.each(JSON.parse('${salesRatio}'), function(index, item) {
	  			salesRatioLabels.push(item.TYPE);
	  			salesRatioData.push(item.RATIO);
		  	});
	  		var myChart = new Chart(bookCategory, {
	  			type: 'pie',
	  	        data: {
	  	        	labels: salesRatioLabels,
	  	            datasets: [{
	  	            	data: salesRatioData,
	  	               	backgroundColor: [
		  	               	"rgba(117, 113, 249, 0.7)",
	  	                	"rgba(144, 151, 196, 0.7)",
	  	                    "rgba(111, 217, 111, 0.7)",
	  	                  	"rgba(242, 157, 86, 0.7)",
	  	                    "rgba(255, 94, 94, 0.7)"
	  	                   ],
	  	                   borderColor: [
	  	                	 "rgba(117, 113, 249, 0.7)",
	  	                	"rgba(144, 151, 196, 0.7)",
	  	                    "rgba(111, 217, 111, 0.7)",
	  	                  	"rgba(242, 157, 86, 0.7)",
	  	                    "rgba(255, 94, 94, 0.7)"
	  	                   ],
	  	                   borderWidth: "0"
	  	            }]
	  	        },
	  	      options: {
	              tooltips: {
	                  mode: 'label',
	                  callbacks: {
	                      label: function(tooltipItem, data) {
	                          return data['datasets'][0]['data'][tooltipItem['index']] + '%';
	                      }
	                  }
	              }
		       }
	  		});
		</script>
       
    </div>

    <div class="row" style="padding: 0 30px;">
    	<div class="col-lg-12">
           <div class="card">
               <div class="card-body">
                   <h4 class="card-title mb-5 font-weight-bold">연령대별</h4>
                   <canvas id="ageGroup" width="500" height="250"></canvas>
               </div>
           </div>
       </div>
    </div>
    <script>
  		var ageGroup = document.getElementById("ageGroup");
  		ageGroup.height = 150;
  		var ageCountLabels = [];
        var ageCountData =[];
  		 $.each(JSON.parse('${ageCount}'), function(index, item) {
  			ageCountLabels.push(item.BIRTH);
  			ageCountData.push(item.CNT);
	  	});
  		var myChart = new Chart(ageGroup, {
  			type: 'bar',
  	        data: {
  	            labels: ageCountLabels,
  	            datasets: [{
  	               	data: ageCountData,
	  	              borderColor: "rgba(77, 124, 255, 0.8)",
	                  borderWidth: "0",
	                  backgroundColor: "rgba(77, 124, 255, 0.8)"
  	            }]
  	        },
  	        options: {
  	        	legend: {
  	                display: false
  	            },
  	            scales: {
  	                yAxes: [{
  	                    ticks: {
  	                        beginAtZero: true
  	                    }
  	                }],
  	              xAxes: [{
                      // Change here
                      barPercentage: 0.2
                  }]
  	            }
  	        }
  		});
 		</script>
</div>

