{-# OPTIONS_GHC -fno-warn-orphans #-}

module ArbitraryGeneratedTestTypes where

import qualified Data.ByteString    as BS
import qualified Data.Text.Lazy     as T
import qualified Data.Vector        as V
import           Test.QuickCheck    (Arbitrary, arbitrary,
                                     arbitraryBoundedEnum, listOf)

import           TestProto
import qualified TestProtoImport

instance Arbitrary a => Arbitrary (V.Vector a) where
  arbitrary = V.fromList <$> listOf arbitrary

instance Arbitrary Trivial where
  arbitrary = Trivial <$> arbitrary

instance Arbitrary MultipleFields where
  arbitrary =
    MultipleFields
    <$> arbitrary
    <*> arbitrary
    <*> arbitrary
    <*> arbitrary
    <*> fmap T.pack arbitrary
    <*> arbitrary

instance Arbitrary WithEnum_TestEnum where
  arbitrary = arbitraryBoundedEnum

instance Arbitrary WithEnum where
  arbitrary = WithEnum <$> arbitrary

instance Arbitrary WithNesting_Nested where
  arbitrary =
    WithNesting_Nested
    <$> fmap T.pack arbitrary
    <*> arbitrary
    <*> arbitrary
    <*> arbitrary

instance Arbitrary WithNesting where
  arbitrary = WithNesting <$> arbitrary

instance Arbitrary WithRepetition where
  arbitrary = WithRepetition <$> arbitrary

instance Arbitrary WithFixed where
  arbitrary = WithFixed <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary WithBytes where
  arbitrary = WithBytes <$> arbitrary <*> arbitrary

instance Arbitrary BS.ByteString where
  arbitrary = BS.pack <$> arbitrary

instance Arbitrary AllPackedTypes where
  arbitrary =
    AllPackedTypes
    <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary
    <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary SignedInts where
  arbitrary = SignedInts <$> arbitrary <*> arbitrary

instance Arbitrary WithNestingRepeated where
  arbitrary = WithNestingRepeated <$> arbitrary

instance Arbitrary WithNestingRepeated_Nested where
  arbitrary =
    WithNestingRepeated_Nested
    <$> fmap T.pack arbitrary
    <*> arbitrary
    <*> arbitrary
    <*> arbitrary

instance Arbitrary WithNestingRepeatedInts where
  arbitrary = WithNestingRepeatedInts <$> arbitrary

instance Arbitrary NestedInts where
  arbitrary = NestedInts <$> arbitrary <*> arbitrary

instance Arbitrary OutOfOrderFields where
  arbitrary =
    OutOfOrderFields
    <$> arbitrary
    <*> fmap T.pack arbitrary
    <*> arbitrary
    <*> fmap (fmap T.pack) arbitrary

instance Arbitrary UsingImported where
  arbitrary =
    UsingImported
    <$> arbitrary
    <*> arbitrary

instance Arbitrary TestProtoImport.WithNesting where
  arbitrary =
    TestProtoImport.WithNesting
    <$> arbitrary
    <*> arbitrary

instance Arbitrary TestProtoImport.WithNesting_Nested where
  arbitrary =
    TestProtoImport.WithNesting_Nested
    <$> arbitrary
    <*> arbitrary

instance Arbitrary Wrapped where
  arbitrary = Wrapped <$> arbitrary
