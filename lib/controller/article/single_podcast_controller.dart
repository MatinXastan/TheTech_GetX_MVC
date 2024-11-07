import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:thetech_getx/constant/api_constant.dart';
import 'package:thetech_getx/models/podcasts_file_model.dart';
import 'package:thetech_getx/services/dio_services.dart';

class SinglePodcastController extends GetxController {
  var id;
  SinglePodcastController({this.id});
  RxInt currentFileIndex = 0.obs;
  RxBool loading = false.obs;

  RxList<PodcastsFileModel> podcastFileList = RxList();
  final player = AudioPlayer();

  late var playList;
  RxBool playState = false.obs;
  RxBool isLoopAll = false.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    playList = ConcatenatingAudioSource(useLazyPreparation: true, children: []);
    await getPodcastFiles();
    await player.setAudioSource(playList,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  getPodcastFiles() async {
    loading.value = true;
    var response =
        await DioServices().getMethode(ApiUrlConstant.podcastFiles + id);
    if (response.statusCode == 200) {
      for (var element in response.data['files']) {
        podcastFileList.add(PodcastsFileModel.fromJson(element));
        playList.add(AudioSource.uri(
            Uri.parse(PodcastsFileModel.fromJson(element).file!)));
      }
      loading.value = false;
    }
  }

  Rx<Duration> progressValue = Duration(seconds: 0).obs;
  Rx<Duration> bufferedValue = Duration(seconds: 0).obs;
  Timer? timer;

  startProgress() {
    const tick = Duration(seconds: 1);
    int duratiion = player.duration!.inSeconds - player.position.inSeconds;

    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
    }

    timer = Timer.periodic(
      tick,
      (timer) {
        duratiion--;
        progressValue.value = player.position;
        bufferedValue.value = player.bufferedPosition;

        if (duratiion <= 0) {
          timer.cancel();
          progressValue.value = Duration(seconds: 0);
          bufferedValue.value = Duration(seconds: 0);
        }
      },
    );
  }

  setLoopMode() {
    if (isLoopAll.value) {
      isLoopAll.value = false;
      player.setLoopMode(LoopMode.off);
    } else {
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
    }
  }
}
