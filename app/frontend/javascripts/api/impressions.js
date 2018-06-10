import { axios } from '../utils/http-client';

export default {
  create(params) {
    return axios.post('/impressions', {
      impression: {
        comic_title: params.comicTitle,
        emotion_ids: params.emotions,
        best_scene: params.bestScene,
        capture: params.captureImage,
        report: params.report,
      },
    });
  },
};
