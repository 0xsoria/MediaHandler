//
//  PresentationObject.m
//  iOSOBJC
//
//  Created by Gabriel Soria Souza on 16/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

#import "PresentationObject.h"

@implementation PresentationObject

- (void)toneGeneratorError:(UINavigationController *)navigationController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error in the tone generator!" message:@"Please input a real number" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)toneGeneratorPresenter:(UINavigationController *)navigationController withDurationSampleRateAndFrequency:(void (^ __nullable)(NSNumber *, NSNumber *, NSNumber *, NSError *))withDurationSampleRateAndFrequency {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"This is a tone generator!" message:@"What is the frequency of the tone you want to generate" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Duration";
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Sample Rate";
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Frequency";
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSNumber *duration = [formatter numberFromString:alert.textFields.firstObject.text];
    NSNumber *sampleRate = [formatter numberFromString:alert.textFields[1].text];
    NSNumber *freq = [formatter numberFromString:alert.textFields[2].text];
    
    UIAlertAction *tone = [UIAlertAction actionWithTitle:@"Generate" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (duration != nil || sampleRate != nil || freq != nil) {
            withDurationSampleRateAndFrequency(
            duration,
            sampleRate,
            freq, nil);
        }
        NSError *myError = [NSError alloc];
        withDurationSampleRateAndFrequency(nil, nil, nil, myError);
        
    }];
    
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:tone];
    [alert addAction:cancel];
    
    [navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)noAccessAlert:(UINavigationController *)navigationController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"You do not have access to the photo library, to give the access please go to settings. " preferredStyle:UIAlertControllerStyleAlert];
    
    NSDictionary *dict;
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *urlFromString = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [UIApplication.sharedApplication openURL:urlFromString options:dict completionHandler:nil];
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alert addAction:settingsAction];
    [alert addAction:cancel];
    
    [navigationController presentViewController:alert animated:TRUE completion:nil];
}

- (void)presentFileDownloaderAlertWithNavigationController:(UINavigationController *)navigationController completion:(void (^ __nullable)(NSString *))completion {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Place the url for the audio file" message:@"URL for file" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"URL";
    }];
    
    UIAlertAction *downloadAction = [UIAlertAction actionWithTitle:@"Download" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(alert.textFields.firstObject.text);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:downloadAction];
    [alert addAction:cancelAction];
    
    [navigationController presentViewController:alert animated:YES completion: nil];
}

- (void)presentNewItemAlertWithNavigationController:(UINavigationController *)navigationController completion:(void (^ __nullable)(MediaAction))completion {
    
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"What kind of file you want to add?" message:@"Choose what kind of file you would like to add." preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *downloadAudio = [UIAlertAction actionWithTitle:@"Download Audio File" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(MediaActionDownloadAudio);
    }];
    
    UIAlertAction *videoAction = [UIAlertAction actionWithTitle:@"Video" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(MediaActionRecordVideo);
    }];
    UIAlertAction *toneGeneratorAction = [UIAlertAction actionWithTitle:@"Tone Generator" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(MediaActionToneGenenerator);
    }];
    
    UIAlertAction *imageAction = [UIAlertAction actionWithTitle:@"Image" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(MediaActionImageAction);
    }];
    UIAlertAction *audioAction = [UIAlertAction actionWithTitle:@"Audio" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        completion(MediaActionAudio);
    }];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(MediaActionPhotoAction);
    }];
    UIAlertAction *recordVideoAction = [UIAlertAction actionWithTitle:@"Record Video" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(MediaActionRecordVideo);
    }];
    UIAlertAction *recordAudioAction = [UIAlertAction actionWithTitle:@"Record Audio" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completion(MediaActionRecordAudio);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [sheet addAction:downloadAudio];
    [sheet addAction:videoAction];
    [sheet addAction:toneGeneratorAction];
    [sheet addAction:imageAction];
    [sheet addAction:audioAction];
    [sheet addAction:photoAction];
    [sheet addAction:recordVideoAction];
    [sheet addAction:recordAudioAction];
    [sheet addAction:cancelAction];
    
    [navigationController presentViewController:sheet animated:YES completion:nil];
}

@end
