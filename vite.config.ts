import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
  base: '/',
  server: {
    port: 8080,
    cors: true // 允许跨域
  },
  plugins: [react()]
});
