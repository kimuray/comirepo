import { axios } from '../utils/http-client';

export default {
  filterTitle(word) {
    return axios.get('/comics', {
      params: {
        word: word,
      },
    });
  },
};
