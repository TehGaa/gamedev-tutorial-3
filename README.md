Double jump dicapai dengan membuat counter lompatan yang akan ter reset ketika player menyentuh tanah.
Bila counter bernilai 1 dan player belum menyentuh tanah, maka player dapat melompat kembali.

<br>

Dash dilakukan dengan melakukan counter panah kiri dan kanan. Ketika menekan tombol kiri sebanyak 2 kali,
maka player akan dash ke arah kiri. Begitupun sebaliknya untuk arah kanan.

<br>

Proses pengerjaan animasi dengan mengubah play animasi ketika pemain menekan tombol panah yang berbeda.
Pengubahan play animasi dengan mengambil node $AnimatedSprite2D kemudian menggunakan method play serta
mengisinya dengan argumen berupa nama yang sesuai dengan animasi terkait. Misal, ketika player
menekan tombol panah bawah, maka animasi yang akan dimainkan bernama "crouch".

