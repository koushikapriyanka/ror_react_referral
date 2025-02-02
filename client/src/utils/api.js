import axios from "axios";
import { getAuthTokens } from "./auth";

const axiosInstance = axios.create({
  baseURL: "http://localhost:3000/api/v1",
  headers: {
    "Content-Type": "application/json",
  },
});

axiosInstance.interceptors.request.use(
  (config) => {
    const { accessToken, client, uid } = getAuthTokens();
    if (accessToken && client && uid) {
      config.headers["access-token"] = accessToken;
      config.headers["client"] = client;
      config.headers["uid"] = uid;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

export default axiosInstance;
