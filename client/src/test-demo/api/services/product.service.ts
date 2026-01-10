import type {Product} from "../../../app/models/product.ts";
import axiosClient from "../axiosClient.tsx";


interface ApiResponse<T> {
    data: {
        content: T[]
        totalElements?: number
        totalPages?: number
        currentPage?: number
    }
    message?: string
    status?: string
}

export const productService = {

    /**
     * Lấy danh sách products
     * @param page - Số trang (optional)
     * @param size - Số items mỗi trang (optional)
     * @returns Promise<Product[]>
     */
    getList: async (page?: number, size?: number): Promise<Product[]> => {
        try {
            const params: Record<string, string> = {};
            if (page !== undefined) params.page = page.toString();
            if (size !== undefined) params.size = size.toString();

            const response = await axiosClient.get<ApiResponse<Product>>('/products', {params});
            return response.data.data.content;
        } catch (error) {
            console.error('Error fetching product list:', error);
            throw error;
        }
    },
    getById: async (id: number): Promise<Product> => {
        try {
            const response = await axiosClient.get<Product>(`/products/${id}`);
            return response.data;
        } catch (error) {
            console.error(`Error fetching product ${id}:`, error)
            throw error
        }
    },
}