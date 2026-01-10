import './ProductDemo.css'
import {useEffect, useState} from "react";
import type {Product} from "../../app/models/product.ts";
import {productService} from "../api/services/product.service.ts";

function ProductDemo() {

    const [products, setProducts] = useState<Product[]>([]);
    const [loading, setLoading] = useState<boolean>(false);
    const [error, setError] = useState<string | null>(null);
    const [selectedProduct, setSelectedProduct] = useState<Product | null>(null);

    const fetchProduct = async () => {
        setLoading(true)
        setError(null)
        try {
            const data= await  productService.getList()
            setProducts(data)
        } catch (error) {
            setError('Failed to fetch products')
        } finally {
            setLoading(false)
        }
    }

    useEffect(() => {
        fetchProduct()
    }, [])

    const fetchProductDetail = async (productId: number) => {
        setLoading(true)
        setError(null)
        try {
            const product = await productService.getById(productId)
            setSelectedProduct(product)
        } catch (err) {
            setError(`Failed to fetch product ${productId}`)
            console.error(err)
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className='product-list'>
            <h2>Product List</h2>
            <button onClick={fetchProduct}>🔄 Refresh</button>

            {/* Loading State */}
            {loading && <div className="loading">Loading...</div>}

            {/* Error State */}
            {error && <div className="error">❌ {error}</div>}

            {
                products.length === 0 && !loading && (
                    <p>No products found</p>
                )
            }

            <div className='products-grid'>
                {
                    products.map((product) => (
                        <div key={product.id} className="product-card">
                            <h3>{product.name}</h3>
                            <p className="product-description">{product.description}</p>
                            <p className="product-price">${product.price}</p>
                            <p className="product-brand">Brand: {product.productBrand}</p>
                            <p className="product-type">Type: {product.productType}</p>
                            <button
                                onClick={() => fetchProductDetail(product.id)}
                                className="btn-detail"
                            >
                                View Detail
                            </button>
                        </div>
                    ))
                }
            </div>

            {/* Product Detail */}
            {selectedProduct && (
                <div className="product-detail">
                    <h2>Product Detail</h2>
                    <button onClick={() => setSelectedProduct(null)} className="btn-close">
                        ✕ Close
                    </button>
                    <div className="detail-card">
                        <h3>{selectedProduct.name}</h3>
                        <p><strong>ID:</strong> {selectedProduct.id}</p>
                        <p><strong>Description:</strong> {selectedProduct.description}</p>
                        <p><strong>Price:</strong> ${selectedProduct.price}</p>
                        <p><strong>Brand:</strong> {selectedProduct.productBrand}</p>
                        <p><strong>Type:</strong> {selectedProduct.productType}</p>
                        {selectedProduct.pictureUrl && (
                            <img src={selectedProduct.pictureUrl} alt={selectedProduct.name} />
                        )}
                    </div>
                </div>
            )}
        </div>
    )
}

export default ProductDemo