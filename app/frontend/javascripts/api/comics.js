import { axios } from '../utils/http-client';

export default {
  filter_title(word) {
    return axios.get('/comics', {
      params: {
        word: word,
      },
    });
  },
};
