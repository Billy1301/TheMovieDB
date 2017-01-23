//
//  GCDBlackBox.swift
//  My Favorite Movies
//
//  Created by Billy on 1/21/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}

