import { defineConfig } from 'vite'
import reactRefresh from '@vitejs/plugin-react-refresh'
import createReScriptPlugin from './vite-plugin-rescript'
// 按需引入组件样式
import vitePluginImp from 'vite-plugin-imp'

const themeVariables = {
  'primary-color': '#1890ff'
}

// https://vitejs.dev/config/
export default defineConfig({
  // import.meta.env.BASE_URL
  base: '/',
  publicDir: 'public',

  build: {
    rollupOptions: {
      // https://rollupjs.org/guide/en/#big-list-of-options
    },
    sourcemap: true,

    // 500k + 警告
    chunkSizeWarningLimit: 500,
  },

  plugins: [
    // // 自动按需引入样式
    // vitePluginImp({
    //   libList: [
    //     {
    //       libName: 'antd',
    //       style: (name) => {
    //         return ""
    //         // debugger
    //         // return `antd/es/${name}/style`
    //       }
    //     }
    //   ],
    // }),    
    reactRefresh(),
    createReScriptPlugin(),
  ],

  // antd imp
  css: {
    preprocessorOptions: {
      less: {
        // 支持内联 JavaScript
        javascriptEnabled: true,
        modifyVars: themeVariables,
      }
    }
  },  

  server: {
    port: 3000,
    open: true,
  },
})
