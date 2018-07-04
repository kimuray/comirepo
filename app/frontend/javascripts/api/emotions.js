import { axios } from '../utils/http-client';

export default {
  getList() {
    return axios.get('/emotions');
  },
};
