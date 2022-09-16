#!/usr/bin/env bash

rm -f com.carpeludum.KegaFusion.flatpak
rm -rf _build ; mkdir _build
rm -rf _repo ; mkdir _repo

BRANCH=test

flatpak-builder --ccache --force-clean --default-branch=$BRANCH _build com.carpeludum.KegaFusion.yml --repo=_repo
flatpak build-bundle _repo com.carpeludum.KegaFusion.flatpak com.carpeludum.KegaFusion $BRANCH
