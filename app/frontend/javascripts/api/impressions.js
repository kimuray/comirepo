import { axios } from '../utils/http-client';

export default {
  create(params) {
    let volumeNumber = params.volumeNumber;
    if (isNaN(volumeNumber)) {
      volumeNumber = null;
    }
    return axios.post('/impressions', {
      impression: {
        comic_title: params.comicTitle,
        volume_number: volumeNumber,
        emotion_ids: params.emotions,
        evaluation_point: params.evaluationPoint,
        capture: params.captureImage,
        report: params.report,
      },
    });
  },
};
