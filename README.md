# teklifim_gelsin_case_study


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















