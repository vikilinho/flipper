'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"index.html": "7852dd7cef1f700dbcf68471faeaf694",
"/": "7852dd7cef1f700dbcf68471faeaf694",
"main.dart.js": "08fa5224f175169297a305c6aa37690c",
"manifest.json": "a07515bd656286986a22af635b1544c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/images/d1.jpeg": "b7f958fe690f268e7e10e4effdd1f085",
"assets/images/m2.jpeg": "ff316951b4aacd7e44a82bda8a2165aa",
"assets/images/tree2.png": "47fefa407b8ef38c35121140690b8d34",
"assets/images/d6.jpeg": "dd97cd475ae8d82de4849a0ef364054f",
"assets/images/d21.jpeg": "640f00f7a5215a877be7d83e3092eaac",
"assets/images/d20.jpeg": "e2a97e584a7a24183f5cc4e01ed38be7",
"assets/images/c4.jpeg": "4ef4e123f33adf94e3b495795e5152f0",
"assets/images/d9.jpeg": "5b22547584236ca0434cd1b01063f98b",
"assets/images/d15.jpeg": "74bdd61fd9eb85588868be4a8b0db116",
"assets/images/d17.jpeg": "733bb58de138e5b04b2abdc49e3253ce",
"assets/images/d7.jpeg": "76c19d917ba113d269b2c886692c5634",
"assets/images/d14.jpeg": "fa1b4530f18ff68b34ba03d65c75c7d0",
"assets/images/d2.jpeg": "3533a0affe5bbdaa20f3d992cdfa53f1",
"assets/images/d12.jpeg": "974afe2513ca8012ed6a3b5c77a4786d",
"assets/images/xtree.json": "85301f5f07fbccec021877b0f16802b7",
"assets/images/d13.jpeg": "4784af63617efabacd4a98585d093247",
"assets/images/m3.jpeg": "3d3e34e6da860900b2dcf142132bcfa0",
"assets/images/xmessage.json": "7fab52e14614e3c765471978cde23b0f",
"assets/images/d19.jpeg": "7f17790ae5fde87f52a1d82c2dceb1ec",
"assets/images/c12.jpeg": "0d557408ed3baa9cd8933df0af34dbfa",
"assets/images/d10.jpeg": "241084cd45883387c24ee8ee6f283051",
"assets/images/m1.jpeg": "821418a514f022b78d57d5f48dc60f79",
"assets/images/d11.jpeg": "89a071c6c1419a3b08f6916fcdde87af",
"assets/images/tree.png": "28d9a08445308f11467e06bc85f96499",
"assets/images/d22.jpeg": "e69e840fd031cb0eef5e62ec3cc7ba68",
"assets/images/c11.jpeg": "753a9faf8bf46b140196fe9b9f400313",
"assets/images/d18.jpeg": "9907bd1111beaf1d49494f8477a78dc8",
"assets/NOTICES": "daa22cd7400400d51f426a533e1aefda",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "4765721d096b694d8f639e3eb6bf2233",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"version.json": "fbc2ef8e0ea7f413c13af93b5a0a286a"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
