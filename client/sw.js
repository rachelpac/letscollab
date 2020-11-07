var cacheName = 'CSv5';
var cachedFiles = [
    'index.html',
    'manifest.json',
    'js/script.js',
    'css/style.css'
];

self.addEventListener("install", installServiceWorker, false);

function installServiceWorker(evt) {
    console.log("Service Worker Install Event");
    // add the files to the cache
    evt.waitUntil(
        caches.open(cacheName)
        .then((cache) => {
            console.log('Caching Files');
            return cache.addAll((cachedFiles));
        })
        .then(() => {
            return self.skipWaiting();
        })
        .catch((error) => {
            console.log('Cache Failed', error);
        })
    );
}

self.addEventListener("activate", activeServiceWorker, false);

function activeServiceWorker(evt) {
    console.log("Service Worker Activated");
    evt.waitUntil(
        caches.keys()
        .then((keyList) => {
            return Promise.all(keyList.map((key) => {
                if (key !== cacheName) {
                    console.log("Removing Old Cache", key);
                    return caches.delete(key)
                }
            }));
        })
    );
    return self.clients.claim();
}

self.addEventListener("fetch", fetchServiceWorkerRequests, false);

function fetchServiceWorkerRequests(evt) {
    console.log("Fetch Event" + evt.request.url);
    evt.respondWith(
        caches.match(evt.request)
        .then((response) => {
            return response || fetch(evt.request);
        })
    );
}