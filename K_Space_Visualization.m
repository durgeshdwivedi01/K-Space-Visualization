% Create a phantom image
phantom_image = phantom(256);

% Compute the 2D Fourier Transform to get k-space data
k_space = fft2(phantom_image);

% Extract magnitude and phase from k-space data
magnitude_k_space = abs(k_space);
phase_k_space = angle(k_space);

% Perform Inverse 2D Fourier Transform to reconstruct the image
reconstructed_image = ifft2(k_space);

% Display the original phantom, magnitude of k-space, phase of k-space, and the reconstructed image
figure;
subplot(2,2,1);
imshow(phantom_image, []);
title('Original Phantom');

subplot(2,2,2);
imshow(log(1 + magnitude_k_space), []); % log scale for better visibility
title('Magnitude of k-space');

subplot(2,2,3);
imshow(phase_k_space, []);
title('Phase of k-space');

subplot(2,2,4);
imshow(abs(reconstructed_image), []); % Use abs to convert complex to real
title('Reconstructed Image');
