# teklifim_gelsin_case_study
<img width="300" height ="600" alt="Screenshot 2023-08-27 at 18 53 14" src="https://github.com/volkaankarakus/teklifim_gelsin_case_study/assets/64658867/fdab474b-0c40-4f37-b74e-35fa1fa93f56">
<img width="300" height ="600" alt="Screenshot 2023-08-27 at 18 46 41" src="https://github.com/volkaankarakus/teklifim_gelsin_case_study/assets/64658867/aa439baf-7db1-41f0-aaec-78bb5792fe24">
<img width="300" height ="600" alt="Screenshot 2023-08-27 at 18 46 52" src="https://github.com/volkaankarakus/teklifim_gelsin_case_study/assets/64658867/c523dca2-d5b6-48b5-9992-4d92c2c74aed">
<img width="300" height ="600" alt="Screenshot 2023-08-27 at 18 46 59" src="https://github.com/volkaankarakus/teklifim_gelsin_case_study/assets/64658867/b8dcc7bc-a47e-492e-88db-e594f58edefd">
<img width="300" height ="600" alt="Screenshot 2023-08-27 at 18 47 08" src="https://github.com/volkaankarakus/teklifim_gelsin_case_study/assets/64658867/8fd25be8-7792-477c-a0f2-c5aef2c97a11">
<img width="300" height ="600" alt="Screenshot 2023-08-27 at 18 47 16" src="https://github.com/volkaankarakus/teklifim_gelsin_case_study/assets/64658867/f82a866a-327a-41b1-924a-2a3986cea10f">

<h4 align="start">Each of the titles described in this project will be branched as trunk-based-development.</h4>
<h4 align="start">Also, if you want to see the project status in a table, I have opened the Project Table in the repository for you (like Trello or Confluence).</h4>
<h4 align="start">The project is completely dynamically designed and as a "Responsive Framework", it gives results in the same dimensions on different screens.</h4>

<h3 align="start"> 1 - Data Modelling</h3>
<h4 align="start"> First, the data given in the project documentation and the model json returned to us by post request via Postman were examined.</h4>
<h4 align="start"> toJson(), fromJson(), and props are defined as "OffersModel", the model containing all the data, and "OfferModel" for identical submodels.</h4>
<h4 align="start"> At this stage, the reason why generator packages such as "json_serializable" and "json_annotation" are not used is to be able to fetch and pull data as custom.</h4>

<h3 align="start"> 2 - Network Service</h3>
<h4 align="start"> Builder Design Pattern was used for Network Manager. Although the Dio package was chosen for RestAPI use, a generic abstact INetworkManager class was written so that this package could be replaced or added to any other package such as "http" later on.</h4>
<h4 align="start"> Then, all network parts were defined one by one for DioManager. It has been made available for all "post","get","update" and "delete" methods.</h4>
<h4 align="start"> These parts were combined with "NetworkDioMakerService" and this service was made available for DEPENDENCY INJECTION.</h4>
<h4 align="start"> For the given post request, this dependency injection class is called by creating a post file in the request file. The reason for making such a definition in the request file is to KEEP EACH REQUEST SEPERATE FROM EACH OTHER EASILY.</h4>

<h3 align="start"> 3 - Image Service </h3>
<h4 align="start"> "CustomImageCacheManager" was written so that the build and rendering times of all images to be used in the project would not cause problems in the application. This service resets itself every "15 DAYS" and limits the images to be cached to "100 IMAGES" during this period. Using this service, when the app is opened repeatedly, the images will not be reloaded and will be displayed quickly.</h4>

<h3 align="start"> 4 - HomePage & HomeDetail Page & Extensions & Bloc/Cubit </h3>
<h4 align="start"> For both pages, the states are in their own "state" script, the methods in the "cubit" script are used for changes on the states and screen changes.</h4>
<h4 align="start"> Special extensions of variables or models were written for changes in state.</h4>
<h4 align="start"> A viewModel belonging to HomeDetailView did not need to exist on a per-project basis. We could use these values ​​in a single viewModel with "BlocProvider.value()". But since HomeDetailView's SPECIFIC STATES CAN BE DEFINED LATER, a BlocProvider specific to this page is defined (with MultiBlocProvider). The data used when going to HomeDetailView is taken from HomeView by set. </h4>

<h3 align="start"> 5 - Bloc/Cubit List Manupulation </h3>
<h4 align="start"> When using Bloc/Cubit, for field manipulations in any list, a new list definition must be given with .toList() even if it is defined, instant screen changes must be given with the initList() method and didChangeDependency() in the view, which are also necessary for the changes to be displayed on the screen.</h4>

<h3 align="start"> 6 - Widget Design </h3>
<h4 align="start"> The general widgets to be used in the project are defined in the widget file. Widgets in Views are also fragmented into "subwidgets" within this widget file as much as possible.</h4>






























