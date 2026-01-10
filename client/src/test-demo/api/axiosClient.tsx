import axios, {type AxiosInstance} from "axios";

const axiosClient: AxiosInstance = axios.create({
    baseURL: 'http://localhost:8081/api',
    timeout: 1000,
    headers: {
        'Content-Type': 'application/json'
    },
})

axiosClient.interceptors.request.use(
    (config) => {
        const token = localStorage.getItem('token');
        if(token) {
            config.headers.Authorization = `Bearer ${token}`
        }

        console.log('🚀 Request:', config.method?.toUpperCase(), config.url)
        return config;
    },
    (error) => {
        console.error('❌ Request Error:', error);
        return Promise.reject(error);
    }
)

axiosClient.interceptors.response.use(
    (response) => {
        console.log('✅ Response:', response.status, response.config.url);
        return response;
    },
    (error) => {
        if(error.response){
            switch (error.response.status){
                case 401:
                    console.error('❌ Unauthorized: Please log in again.');
                    break;
                case 403:
                    console.error('❌ Forbidden: You do not have permission to access this resource.');
                    break;
                case 404:
                    console.error('❌ Not Found: The requested resource could not be found.');
                    break;
                case 500:
                    console.error('❌ Internal Server Error: Please try again later.');
                    break;
                default:
                    console.error(`❌ Error ${error.response.status}: ${error.response.data?.message || 'An error occurred.'}`);
            }
        }
        else if (error.request) {
            console.error('❌ Network Error: Please check your internet connection.');
        }
        else{
            console.error('❌ Error:', error.message);
        }

        return Promise.reject(error);
    }
)

export default axiosClient;

