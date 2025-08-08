// Doanh thu theo tháng
const revenueCtx = document.getElementById('revenueChart').getContext('2d');
new Chart(revenueCtx, {
    type: 'line',
    data: {
        labels: revenueMonths, // Dữ liệu từ file PHP
        datasets: [{
            label: 'Doanh thu (VND)',
            data: revenueData, // Dữ liệu từ file PHP
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: true }
        },
        scales: {
            y: { beginAtZero: true },
            x: { title: { display: true, text: 'Tháng' } }
        }
    }
});

// Các món ăn được gọi nhiều nhất
const popularItemsCtx = document.getElementById('popularItemsChart').getContext('2d');
new Chart(popularItemsCtx, {
    type: 'pie',
    data: {
        labels: popularItems, // Dữ liệu từ file PHP
        datasets: [{
            label: 'Số lượng',
            data: popularQuantities, // Dữ liệu từ file PHP
            backgroundColor: [
                'rgba(255, 99, 132, 0.6)',
                'rgba(54, 162, 235, 0.6)',
                'rgba(255, 206, 86, 0.6)',
                'rgba(75, 192, 192, 0.6)',
                'rgba(153, 102, 255, 0.6)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: true }
        }
    }
});
