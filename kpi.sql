-- KPI Total Penjualan Berdasarkan Kategori Produk per Tahun
SELECT
    d.year AS Tahun,
    p.Category AS Kategori_Produk,
    SUM(f.Sales) AS Total_Penjualan,
    SUM(f.Quantity) AS Total_Volume_Terjual
FROM dw_retailsales2.fact_sales f
JOIN dw_retailsales2.dim_product p
    ON f.id_dimProduct = p.id_dimProduct
JOIN dw_retailsales2.dim_date d
    ON f. Order Date = d.Date  
GROUP BY d.Year, p.Category
ORDER BY d.Year DESC, Total_Penjual DESC;  


-- KPI Analisis Produk Terlaris Berdasarkan Total Pendapatan Penjualan
SELECT
    d. Year AS Tahun,
    p. 'Product ID' AS ID_Produk,
    p. 'Product Name' AS Nama_Produk,
    SUM(f.Quantity) AS Total_Kuantitas,
    SUM(f.Sales) AS Total_Pendapatan
FROM dw_retailsales2.fact_sales f
JOIN dw_retailsales2.dim_product p
    ON f.id_dimProduct = p.id_dimProduct
JOIN dw_retailsales2.dim_date d
    ON f. 'Order Date' = d.Date
GROUP BY
    d.Year,
    p. 'Product ID',
    p. 'Product Name'
ORDER BY Total_Pendapatan DESC;


-- KPI Analisis Total Penjualan Berdasarkan Wilayah
SELECT
    1.State AS Wilayah,
    COUNT(DISTINCT f. 'Order ID') AS Jumlah_Transaksi,
    SUM(f.Sales) AS Total_Penjualan
FROM dw_retailsales2.fact_sales f
JOIN dw_retailsales2.dim_location 1
    ON f.id_dimLocation = 1.id_dimLocation
GROUP BY 1.State
ORDER BY Total_Penjualan DESC;


-- KPI Analisis Pengaruh Diskon terhadap Profit Penjualan
SELECT
    f.Discount AS Diskon,
    COUNT(f. 'Order ID') AS Jumlah_Transaksi,
    SUM(f.Sales) AS Total_Penjualan,
    SUM(f.Profit) AS Total_Profit
FROM dw_retailsales2.fact_sales f
GROUP BY
    f.Discount
ORDER BY Total_Profit DESC;