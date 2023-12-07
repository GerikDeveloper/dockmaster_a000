'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "517514bef67b53782cee10acaf9f2538",
"index.html": "cdbc994c61590d7ffe249738e9a5b7af",
"/": "cdbc994c61590d7ffe249738e9a5b7af",
"main.dart.js": "8338e7c15a7519a26e44ade67394b063",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "c5248eaf7c9755de1718ea9b0fd5442c",
"assets/AssetManifest.json": "5e093cab614fb80a51ac4e00ac7af2e5",
"assets/NOTICES": "bff56dfe321dbcadeef09184c7670529",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "9cf023685b7a50d598a6cb10b705a547",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "d188cfc260da64b5d97c4f044492216b",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/page-1/images/union-Q7v.png": "bfbeb7cb4b83d99838d1ca26e5e2f4ed",
"assets/assets/page-1/images/b8-3-1-AXv.png": "c2b27fdb55ee8d957a9891128ecc1d63",
"assets/assets/page-1/images/property-1variant2-Wfn.png": "b83014248af78a34cfa9d700e8cdc8fa",
"assets/assets/page-1/images/union-krG.png": "bfbeb7cb4b83d99838d1ca26e5e2f4ed",
"assets/assets/page-1/images/component-3.png": "c122236fc34af66e019796e270ec34c5",
"assets/assets/page-1/images/image-9.png": "f652f578a0897978e14d8f64dad6e35c",
"assets/assets/page-1/images/image-8.png": "b723d4660fdb3be1936919699099fe31",
"assets/assets/page-1/images/union-XPr.png": "bfbeb7cb4b83d99838d1ca26e5e2f4ed",
"assets/assets/page-1/images/-RB2.png": "e9c3dcd63acde61c182b94fa8b006a6a",
"assets/assets/page-1/images/fr-fond-1-4Pe.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/group-1.png": "bd60060ed29840144e1dec91160521fb",
"assets/assets/page-1/images/-jh6.png": "254921f686421f4fbd5279d3ac730a6a",
"assets/assets/page-1/images/b8-3-1-VY8.png": "65526f5ec791f896417e207de9290f7d",
"assets/assets/page-1/images/fr-fond-1.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/component-5.png": "c122236fc34af66e019796e270ec34c5",
"assets/assets/page-1/images/line-5-Kye.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/b8-3-1-gbn.png": "84c809fe838643afffa888e92b288043",
"assets/assets/page-1/images/component-4.png": "c122236fc34af66e019796e270ec34c5",
"assets/assets/page-1/images/-Toa.png": "e9c3dcd63acde61c182b94fa8b006a6a",
"assets/assets/page-1/images/-DHN.png": "3c1cce548035e8394553ae0ae7c82fff",
"assets/assets/page-1/images/line-5.png": "ae05c6f7c32081be702bf62dd34bedfc",
"assets/assets/page-1/images/group-1-sfa.png": "bd60060ed29840144e1dec91160521fb",
"assets/assets/page-1/images/b8-3-1-fF2.png": "25c6dfbace211aeeb9fdcd65c25e9a3b",
"assets/assets/page-1/images/line-5-zMi.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/line-7.png": "aad2d208438ea81cc732c742c6c56001",
"assets/assets/page-1/images/fr-fond-1-QCc.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/line-6.png": "aad2d208438ea81cc732c742c6c56001",
"assets/assets/page-1/images/image-19.png": "2f9976259a6d79f6c1b9a5a838d2e6bc",
"assets/assets/page-1/images/rectangle-16-1sz.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/rectangle-16-Nqr.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/-Wbv.png": "a79788de35b5f233aa36cc8c57ccc017",
"assets/assets/page-1/images/rectangle-16-UDr.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/image-18.png": "ab03a4dc90fa1f66e6a229ad805acbbc",
"assets/assets/page-1/images/-MP2.png": "e9c3dcd63acde61c182b94fa8b006a6a",
"assets/assets/page-1/images/line-5-sZn.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/rectangle-16-FdN.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/vector.png": "5033c34b10442bdf036e593f865ef0b0",
"assets/assets/page-1/images/vector-zMr.png": "8e99c3bc8588334b80cad47fe7daaf6b",
"assets/assets/page-1/images/image-19-tpC.png": "2f9976259a6d79f6c1b9a5a838d2e6bc",
"assets/assets/page-1/images/property-1variant2-1zU.png": "7a45e601320a85651e758bcf4c2c16c0",
"assets/assets/page-1/images/line-5-3nL.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/-ZiL.png": "a79788de35b5f233aa36cc8c57ccc017",
"assets/assets/page-1/images/line-5-RPJ.png": "ae05c6f7c32081be702bf62dd34bedfc",
"assets/assets/page-1/images/property-1variant3-Ti4.png": "16cc805462e76519a9445971cbc12994",
"assets/assets/page-1/images/vector-fJC.png": "5033c34b10442bdf036e593f865ef0b0",
"assets/assets/page-1/images/line-7-2T6.png": "aad2d208438ea81cc732c742c6c56001",
"assets/assets/page-1/images/property-1variant3-Pj2.png": "29f2b6ccc6027184ae7e070665b65f22",
"assets/assets/page-1/images/image-10.png": "7f550de7336c7f1b0621df32593d0615",
"assets/assets/page-1/images/b8-3-1-jMv.png": "17825329f6fe430450a982bb1c34035d",
"assets/assets/page-1/images/line-5-VPA.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/property-1default-f4g.png": "bfbeb7cb4b83d99838d1ca26e5e2f4ed",
"assets/assets/page-1/images/rectangle-16-iaG.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/property-1default-4FE.png": "e9c3dcd63acde61c182b94fa8b006a6a",
"assets/assets/page-1/images/rectangle-16.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/image-11.png": "10d274636635be0d0e9c34cf34277b73",
"assets/assets/page-1/images/rectangle-16-Yr8.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/rectangle-16-Ktg.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/line-5-9oJ.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/rectangle-16-L3n.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/b8-3-1.png": "2d2c1be27bce1ef3bcac863d9e928c91",
"assets/assets/page-1/images/image-12.png": "1cd607d561d79b954dc728d11c5aa277",
"assets/assets/page-1/images/-8ip.png": "e9c3dcd63acde61c182b94fa8b006a6a",
"assets/assets/page-1/images/-MpY.png": "a79788de35b5f233aa36cc8c57ccc017",
"assets/assets/page-1/images/b8-3-1-zEg.png": "65526f5ec791f896417e207de9290f7d",
"assets/assets/page-1/images/image-16.png": "8541d8d90ab22434e3184065d07a15ca",
"assets/assets/page-1/images/rectangle-16-Gax.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/property-1variant4-XuW.png": "b35f68978f577865bb82c4fe832424bc",
"assets/assets/page-1/images/group-1-78p.png": "bd60060ed29840144e1dec91160521fb",
"assets/assets/page-1/images/union-wkY.png": "bfbeb7cb4b83d99838d1ca26e5e2f4ed",
"assets/assets/page-1/images/line-7-x5J.png": "aad2d208438ea81cc732c742c6c56001",
"assets/assets/page-1/images/fr-fond-1-UQk.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/image-17.png": "f10528008a43a8bbf7f506871f66d77f",
"assets/assets/page-1/images/line-5-8KE.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/fr-fond-1-wpx.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/image-15.png": "07b60f3249f9c30ebcad3677af9465c0",
"assets/assets/page-1/images/b8-3-1-J4L.png": "87806b6ca9eb53f03712f287659682f4",
"assets/assets/page-1/images/-5tg.png": "a79788de35b5f233aa36cc8c57ccc017",
"assets/assets/page-1/images/property-1variant5-XmW.png": "34c9a5b3fb05ff3cc0ea775d5f455ed6",
"assets/assets/page-1/images/fr-fond-1-7Ek.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/b8-3-1-SzY.png": "17825329f6fe430450a982bb1c34035d",
"assets/assets/page-1/images/rectangle-16-acU.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/-zPE.png": "a79788de35b5f233aa36cc8c57ccc017",
"assets/assets/page-1/images/property-1variant4.png": "5570064e11e9d375353b9d4c134261ff",
"assets/assets/page-1/images/union-jtY.png": "bfbeb7cb4b83d99838d1ca26e5e2f4ed",
"assets/assets/page-1/images/line-7-JNQ.png": "aad2d208438ea81cc732c742c6c56001",
"assets/assets/page-1/images/image-1.png": "3ca83aa0681e5f92ab694fddeb5bc799",
"assets/assets/page-1/images/property-1default-1gG.png": "c122236fc34af66e019796e270ec34c5",
"assets/assets/page-1/images/union-Nmi.png": "bfbeb7cb4b83d99838d1ca26e5e2f4ed",
"assets/assets/page-1/images/vector-9yn.png": "8e99c3bc8588334b80cad47fe7daaf6b",
"assets/assets/page-1/images/property-1default.png": "c122236fc34af66e019796e270ec34c5",
"assets/assets/page-1/images/property-1variant5.png": "90d26d26ff1300192bc48147a34a373a",
"assets/assets/page-1/images/b8-3-1-Bet.png": "0457ab15c9acf4a2f0a30c3a72a0ca6f",
"assets/assets/page-1/images/line-5-Rnc.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/-eXN.png": "3c1cce548035e8394553ae0ae7c82fff",
"assets/assets/page-1/images/image-3.png": "26ebcee98a92922ec1af12d14dc546c5",
"assets/assets/page-1/images/image-2.png": "ec9be463525fe3ef3e7b563a32dc4f3b",
"assets/assets/page-1/images/fr-fond-1-y4Q.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/union.png": "bfbeb7cb4b83d99838d1ca26e5e2f4ed",
"assets/assets/page-1/images/rectangle-16-6E8.png": "79cd86e7db5231d90db730d3d9195faf",
"assets/assets/page-1/images/property-1variant2.png": "7a14debd822fd6837cb0ffe833ea3a88",
"assets/assets/page-1/images/b8-3-1-SDi.png": "f117bd49af5b0d3146d81ba2735a6cbf",
"assets/assets/page-1/images/line-7-h4g.png": "aad2d208438ea81cc732c742c6c56001",
"assets/assets/page-1/images/property-1variant2-69z.png": "188a2bef71485e9463a382aef27f04ef",
"assets/assets/page-1/images/fr-fond-1-TsA.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/line-5-Rzc.png": "2f53fb83f3f1a91ba38750218d260bf6",
"assets/assets/page-1/images/image-6.png": "daddf4cc1bd49841723e9158e164df9b",
"assets/assets/page-1/images/image-7.png": "c81a279e336b71a25720d579fc40cbf6",
"assets/assets/page-1/images/image-18-Qfv.png": "ab03a4dc90fa1f66e6a229ad805acbbc",
"assets/assets/page-1/images/fr-fond-1-Ju2.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/line-5-E6Q.png": "ae05c6f7c32081be702bf62dd34bedfc",
"assets/assets/page-1/images/property-1variant3.png": "16cc805462e76519a9445971cbc12994",
"assets/assets/page-1/images/fr-fond-1-SuS.png": "28a4e86249d73ac2dc7bf50013075751",
"assets/assets/page-1/images/-RXr.png": "3c1cce548035e8394553ae0ae7c82fff",
"assets/assets/page-1/images/b8-3-1-GmJ.png": "c2b27fdb55ee8d957a9891128ecc1d63",
"assets/assets/page-1/images/image-5.png": "3de57217b31e6772adec1eeaad3dd094",
"assets/assets/page-1/images/image-4.png": "4cc1bc0d6632f2fe2f1eaaf328418571",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
